class UsersController < ApplicationController
  before_action :is_logged_in?
  def profile
    @user = User.find(params[:id])
  end
  
  def is_logged_in?
    user_signed_in? ? return : redirect_to(root_url)
  end
end
