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
		@tickets = Ticket.where(:project_id => @project)
		#@tickets = Ticket.all
	end

	def all
		if !current_user
			redirect_to log_in_path
		end
		@projects = Project.all

		@projects.each_with_index  do |data, index|
		  	#@project.users << User.find(@users[index])
			@members = @projects[index].users
		end
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
			# New Project object with params sent from view
			@project = Project.new(params[:project])

			@users = params[:chosen_userids]

			# Set the owner of the project to the creator
			@project.user_id = current_user.id

			if !@users.blank?
				# Add to relational table projects_users
				@users.each_with_index  do |data, index|
				  	@project.users << User.find(@users[index])
				end
			end

		if @project.save
			redirect_to project_path(@project)
		else
			render :action => "new"
		end
	end

	def edit
  		@project = Project.find_by_id(params[:id])
  		@members = @project.users.all
  		@users = User.all

    end

	def update
	    @user = Project.find(params[:id])
	    @users = params[:chosen_userids]

	    if current_user.id == @user.user_id
	      @project = Project.find(params[:id])

	      @project.users.delete_all

	     if @users
	      @users.each_with_index  do |data, index|
	         @project.users << User.find(@users[index])
	     end
	     end

	     if @project.update_attributes(params[:project])
	      redirect_to projects_path
	     else
	      render :action => :edit
	     end
	    else
	      redirect_to projects_path
	    end
	  end
end