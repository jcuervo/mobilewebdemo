class Api::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:new, :create, :destroy]

  def new
    super
  end

  def create
    if authorized_app?
      user = warden.authenticate(:scope => :user)
      if user
        Rails.logger.info "User Found! #{user.email}"
        user.reset_authentication_token!
        Rails.logger.info "New Token: #{user.authentication_token}"
        render :json => {:access_token => user.authentication_token, 
          :token_type => "persistant"}, :callback => params[:callback]
      else
        render :json => {:error => "Username/password mismatch!"}, :callback => params[:callback]
      end
    else
      render :status=> 404, :json => {:message => "Unauthorized request."}
    end
  end
  
  def destroy
    user = User.find_by_authentication_token(params[:id])
    if user.nil?
      render :status=> 404, :json => {:message => "Invalid token."}
    else
      user.reset_authentication_token!
      render :status=> 200, :json => {:token => params[:id] }
    end
  end
end
