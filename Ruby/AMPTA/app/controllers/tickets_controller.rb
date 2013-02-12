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
  	@ticket = Ticket.find_by_id(params[:id])
  end

  def edit
  	@ticket = Ticket.find_by_id(params[:id])
  end

  def update
  	@ticket = Ticket.find(params[:id])

  	if @ticket.update_attributes(params[:ticket])
  		redirect_to ticket_path(@ticket), :notice => "Ticket updated!"
      else
  		render "new"
  	end
  end

   def destroy
  @user = Ticket.find(params[:id])
  if current_user.id == @user.user_id
   @ticket = Ticket.find(params[:id])
   @ticket.destroy
   redirect_to projects_path
  else
   redirect_to projects_path
  end
 end


  
end
