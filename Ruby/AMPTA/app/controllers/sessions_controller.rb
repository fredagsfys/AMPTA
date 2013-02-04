class SessionsController < ApplicationController
  
  # Display login form
  def new
  end

  # Post login action
  def create
  	user = User.authenticate params[:email], params[:password]

  	if user
  		session[:user_id] = user.id
  		redirect_to projects_path, :notice => "Welcome back," + user.first_name + "!"

  	else
  		flash[:notice] = "Please enter valid information."
  		render "new"
  	end

  end

  # Delete logout action
  def destroy
  	session[:user_id] = nil
  	redirect_to log_in_path #, :notice => "Logged out!"
  end
end
