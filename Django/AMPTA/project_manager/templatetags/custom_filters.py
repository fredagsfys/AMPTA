from django import template
register = template.Library()
from django.contrib.auth.decorators import login_required, permission_required
from project_manager.models import Project, Ticket

@login_required(login_url='/login')
@register.filter(name = 'projects_for_owner')
def projects_for_owner(user):
	return Project.objects.filter(owner = user)

@login_required(login_url='/login')
@register.filter(name = 'tickets_for_owner')
def projects_for_owner(user):
	return Ticket.objects.filter(added_by_user = user)

@login_required(login_url='/login')
@register.filter(name='owner')
def owner(project, user):
	return project.owner == user

@login_required(login_url='/login')
@register.filter(name='member')
def member(project, user):
	return user in project.has_project.all()

@login_required(login_url='/login')
@register.filter(name='owner_ticket')
def owner_ticket(ticket, user):
	return ticket.added_by_user == user