class ProjectsController < ApplicationController
	before_filter :confirm_logged_in, :except => [:session]

	def index
	  if !current_user
	   redirect_to log_in_path
	  end
	end

	def show
		@project = Project.find_by_id(params[:id])
		@owner = User.find(@project.user_id)
		@members = Project.find_by_id(params[:id]).users
		
		if !@members.include?(current_user) && @owner.id != current_user.id
	   		redirect_to all_projects_path, :flash => { :enotice => "You are not a member nor owner of this project!" } 
	  	end
		
		@tickets = Ticket.where(:project_id => @project)
	end

	def all
		@projects = Project.search(params[:search])

		@projects.each_with_index  do |data, index|

			@members = @projects[index].users
		end
	end

	def new
			@user = User.all
			@project = Project.new
	end

	def create
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
		@owner = User.find(@project.user_id)

		if @owner.id != current_user.id
	   		redirect_to all_projects_path, :flash => { :enotice => "You are not a member nor owner of this project!" }
	  	end

		@project = Project.find_by_id(params[:id])
		@members = @project.users.all
		@users = User.all

	end

	def update
		@project = Project.find_by_id(params[:id])
		@owner = User.find(@project.user_id)
		@members = Project.find_by_id(params[:id]).users

		if @owner.id != current_user.id
	   		redirect_to all_projects_path, :flash => { :enotice => "You are not a member nor owner of this project!" }
	  	end


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
	      redirect_to project_path, :notice => "Project was succefully updated!"
	     else
	      render :action => :edit
	     end
	    else
	      redirect_to all_projects_path, :flash => { :enotice =>  "Error - Project was not updated!" }
	    end
	  end

	def destroy
	    
	    @user = Project.find(params[:id])

	    if current_user.id == @user.user_id
		    @project = Project.find(params[:id])
		    @project.destroy
		    redirect_to all_projects_path, :notice => "Project was succefully removed!"
	    else
	    	redirect_to all_projects_path, :flash => { :enotice => "Error - Project was not removed!" }
	    end
	end
end