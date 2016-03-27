class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_is_admin?
  
  def index
  end

  def update
  	current_user.update_attributes(user_params) 
    redirect_to profiles_path
  end

  def user_params
    params.require(:user).permit(:email, :logo)
  end
end
