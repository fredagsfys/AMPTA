class TicketsController < ApplicationController
  def new
  	 @ticket = Ticket.new
  	 @status = Status.all
  end
  def create
  	@project = Project.find(params[:project_id])
  	@ticket = @project.tickets.new(params[:ticket])

  	@ticket = Ticket.new(params[:ticket])
	
      if @ticket.save
	   redirect_to project_path
	  else
	   render :action => 'new'
	  end
end
end
