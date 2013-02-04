class CreateProjectController < ApplicationController
  def new
  	@user = User.all
  	@project = Project.new
  end

  def create
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
