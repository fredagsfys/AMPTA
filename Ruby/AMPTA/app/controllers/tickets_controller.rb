class TicketsController < ApplicationController
  def new
	if !current_user
		redirect_to log_in_path
	end
	@project = Project.find_by_id(params[:project_id])
	@ticket = Ticket.new
	@status = Status.all
  end

  def create
	@project = Project.find(params[:project_id])
	@ticket = Ticket.new(params[:ticket])

	if @ticket.save
		redirect_to project_path(@project)
	else
		render "new"
	end
  end

  def show
  	#@ticketLink = Ticket.where(:project_id => @project)
  end
  
end
