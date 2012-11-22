class Api::HitListsController < ApplicationController
  before_filter :check_user #, :except => [:index, :show]
  respond_to :json

  def index
    if @user
      if authorized_app?
        @hit_lists = HitList.all
      else
        render :status=> 404, :json => {:error => "Unauthorized access!"}
      end
    else
      render :status=> 404, :json => {:error => "User not authorized!"}
    end
  end

  private
    def check_user
      @user = User.find_by_authentication_token(params[:auth_token])
    end
end
