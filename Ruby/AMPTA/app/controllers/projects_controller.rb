class ProjectsController < ApplicationController

	def index
		if !current_user
			redirect_to log_in_path
		end
	end

	def show
		@project = Project.find_by_id(params[:id])
		@owner = User.find(@project.user_id)
		@members = Project.find_by_id(params[:id]).users

	end
end