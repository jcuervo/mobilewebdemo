class HitListsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @hit_lists = HitList.all
  end
  
  def show
    @hit_list = HitList.find(params[:id])
  end
end
