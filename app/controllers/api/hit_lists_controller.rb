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
      render :status=> 404, :json => {:error => "Unauthorized access!"}
    end
  end
  
  def show
    if @user
      if authorized_app?
        @agent = HitList.find(params[:id])
      else
        render :status=> 404, :json => {:error => "Unauthorized access!"}
      end
    else
      render :status=> 404, :json => {:error => "Unauthorized access!"}
    end
  end

  private
    def check_user
      @user = User.find_by_authentication_token(params[:auth_token])
    end
end
