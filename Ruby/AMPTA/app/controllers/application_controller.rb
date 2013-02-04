class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_projects

  private

  # Get online user
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  # Get projects for online user
	def user_projects
    @projectLink = Project.where(:user_id => current_user.id)
	end

end
