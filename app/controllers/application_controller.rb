class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authorized_app?
    params[:app_id].eql?("mobiledemo001") && params[:secret_key].eql?("ZA4fAKzvtSNQYdvn2NM4StGt")
  end
end
