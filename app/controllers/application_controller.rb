class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.

  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.profiles_path, :alert => exception.message
  end

  # def user_is_admin?
  #   if current_user.admin?
  #     redirect_to rails_admin_path
  #   end 
  # end
end
