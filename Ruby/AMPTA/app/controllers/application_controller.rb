class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_projects
  helper_method :user_tickets
  helper_method :confirm_logged_in

  private

  # Get online user
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  # Get projects for online user
	def user_projects
    @projectLink = Project.where(:user_id => current_user.id)
	end

  def user_tickets
    @ticketLink = Ticket.where(:user_id => current_user.id)
  end

  def confirm_logged_in
    unless session[:user_id]
      redirect_to log_in_path
      return false
    else
      return true
    end
  end

end
