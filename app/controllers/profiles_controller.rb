class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_is_admin?
  
  def index
    @user_creator =  Comment.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5) 
    @user_ratings = Rating.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5) 
  end

  def update
  	current_user.update_attributes(user_params) 
    redirect_to profiles_path
  end

  def user_params
    params.require(:user).permit(:email, :name, :logo)
  end
end
