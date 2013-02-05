class ProjectsController < ApplicationController

	def index
		if !current_user
			redirect_to log_in_path
		end
	end

	def show
		if !current_user
			redirect_to log_in_path
		end
		@project = Project.find_by_id(params[:id])
		@owner = User.find(@project.user_id)
		@members = Project.find_by_id(params[:id]).users

	end

	def new
	    if !current_user
	      redirect_to log_in_path
	    end
	  	@user = User.all
	  	@project = Project.new
  	end

  	def create
	    if !current_user
	      redirect_to log_in_path
	    end
	  	@project = Project.new(params[:project])
	    @project.user_id = current_user.id

	    # chosen_userids.each do |c|
	    #   @project.users << params[c.chosen_userids]
	    # end

	  	if @project.save
	  		redirect_to create_project_path
	  	else
	  		render :action => "new"
  	end
  end
end