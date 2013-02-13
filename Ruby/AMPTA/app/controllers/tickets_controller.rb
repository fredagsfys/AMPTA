class TicketsController < ApplicationController
  before_filter :confirm_logged_in, :except => [:session]

  def new

    @project = Project.find_by_id(params[:project_id])
    @ticket = Ticket.new
    @status = Status.all
    @members = Project.find_by_id(params[:project_id]).users

    if !@members.include?(current_user) && @project.user_id != current_user.id
     redirect_to all_projects_path, :flash => { :enotice => "You are not a owner or member of this project!" }
    end
  end

  def create

  	@project = Project.find(params[:project_id])
  	@ticket = Ticket.new(params[:ticket])

  	if @ticket.save
  		redirect_to ticket_path(@ticket)
  	else
  		render "new"
  	end
  end

  def show

    @ticket = Ticket.find_by_id(params[:id])
    @owner = User.find(@ticket.user_id)
    @project = Project.find_by_id(@ticket.project_id)
    @status = Status.find(@ticket.status_id)

    if @owner.id != current_user.id && @project.user_id != @current_user.id
     redirect_to projects_path, :flash => { :enotice => "You are not a owner of this ticket!" }
    end
  end

  def edit

    @ticket = Ticket.find_by_id(params[:id])
    @owner = User.find(@ticket.user_id)
    @project = Project.find_by_id(@ticket.project_id)
    @status = Status.all

    if @owner.id != current_user.id && @project.user_id != @current_user.id
     redirect_to projects_path, :flash => { :enotice => "You are not a owner of this ticket!" }
    end
  end

  def update
    @ticket = Ticket.find_by_id(params[:id])
    @owner = User.find(@ticket.user_id)
    @project = Project.find_by_id(@ticket.project_id)

    if @owner.id != current_user.id && @project.user_id != @current_user.id
     redirect_to projects_path, :flash => { :enotice => "You are not a owner of this ticket!" }
    end

  	if @ticket.update_attributes(params[:ticket])
  		redirect_to ticket_path(@ticket), :notice => "Ticket was succefully updated!"
      else
  		render "new"
  	end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @project = Project.find_by_id(@ticket.project_id)

    if current_user.id == @ticket.user_id || @project.user_id == current_user.id
     @ticket = Ticket.find(params[:id])
     @ticket.destroy
     redirect_to project_path(@project.id), :notice => "Ticket was succefully removed!"
    else
     redirect_to project_path(@project.id), :flash => { :enotice => "Error - Ticket did not get removed!" }
    end
  end 
end
