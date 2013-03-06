# Create your views here.
from django.shortcuts import get_list_or_404, render, redirect, get_object_or_404
from project_manager.models import Project, Ticket, ProjectForm, TicketForm, LoginForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponse, HttpResponseServerError

@login_required(login_url='/login')
def home(request):
    return render(request, 'login/home.html')

@login_required(login_url='/login')
def project_list(request, project_id = None, query = None):
    query = request.GET.get('search')
    if project_id:
        project = get_object_or_404(Project.objects.filter(id = project_id))
        if project.owned_by_user(request.user) or project.member_by_user(request.user):
            tickets = Ticket.objects.filter(projects = project_id)
            return render(request, 'projects/details.html', {'project' : project, "tickets" : tickets})
        else:
            return HttpResponse("Permission denied")

    elif query:
        projects = Project.objects.filter(name__contains = query)
        tickets = None
        return render(request, 'projects/list.html', {'projects' : projects, "tickets" : tickets})
    else:
        projects = Project.objects.order_by('name')
        tickets = None
    
    return render(request, 'projects/list.html', {'projects' : projects, "tickets" : tickets})

@login_required(login_url='/login')
def project_add(request):
    if request.method == 'POST': # If the form has been submitted...
        form = ProjectForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            form.instance.owner = request.user
            new_project = form.save()
            return redirect('project_list_with_ticket', new_project.id) # Redirect after POST
    else:
        form = ProjectForm() # An unbound form

    return render(request, 'projects/add.html', {'form': form})

@login_required(login_url='/login')
def project_edit(request, project_id):
    project = Project.objects.get(id = project_id)

    if project.owned_by_user(request.user):
        if request.method == 'POST': # If the form has been submitted...
            form = ProjectForm(request.POST, instance = project) # A form bound to the POST data
            if form.is_valid(): # All validation rules pass
                form.save()
                return redirect('project_list_with_ticket', project_id)
            else:
                return render(request, 'projects/edit.html', {'form': form}) # Redirect after POST
        else:
            form = ProjectForm(instance = project)
            return render(request, 'projects/edit.html', {'form': form}) # Redirect after POST
    else:
        return HttpResponse("Permission denied")

@login_required(login_url='/login')
def project_delete(request, project_id = None):
    if project_id:
        project = get_object_or_404(Project.objects.filter(id = project_id))

        if project.owned_by_user(request.user):
            project.delete()
            return redirect('project_list') # Redirect after POST
        else:
            return HttpResponse("Permission denied")
    else:
        return render(request, 'project_list_with_ticket', project_id)

@login_required(login_url='/login')
def ticket_list(request, project_id = None, ticket_id = None):
    if ticket_id:      
        ticket = get_object_or_404(Ticket.objects.filter(id = ticket_id))
        project = get_object_or_404(Project.objects.filter(id = project_id))
        if ticket.owned_by_user(request.user) or project.owned_by_user(request.user):
            return render(request, 'tickets/details.html', {"ticket" : ticket, "project" : project })
        else:
            return HttpResponse("Permission denied")

@login_required(login_url='/login')
def ticket_add(request, project_id = None):
    project = get_object_or_404(Project.objects.filter(id = project_id))
    if project.owned_by_user(request.user) or project.member_by_user(request.user):
        if request.method == 'POST': # If the form has been submitted...
            form = TicketForm(request.POST) # A form bound to the POST data
            if form.is_valid(): # All validation rules pass

                form.instance.added_by_user = request.user
                form.instance.projects = Project.objects.get(id = project_id)
                new_ticket = form.save()

                return redirect('ticket_list', project_id, new_ticket.id) # Redirect after POST
        else:
            form = TicketForm() # An unbound form

            return render(request, 'tickets/add.html', {'form': form})
    else:
        return HttpResponse("Permission denied")

@login_required(login_url='/login')
def ticket_edit(request, project_id = None, ticket_id = None):
    ticket = Ticket.objects.get(id = ticket_id)
    project = get_object_or_404(Project.objects.filter(id = project_id))
    if project.owned_by_user(request.user) or ticket.owned_by_user(request.user):
        if request.method == 'POST': # If the form has been submitted...
            form = TicketForm(request.POST, instance = ticket) # A form bound to the POST data
            if form.is_valid(): # All validation rules pass
                form.save()
                return redirect('ticket_list', project_id, ticket_id)
            else:
                return render(request, 'projects/edit.html', {'form': form}) # Redirect after POST
        else:
            form = TicketForm(instance = ticket)
            return render(request, 'tickets/edit.html', {'form': form}) # Redirect after POST
    else:
        return HttpResponse("Permission denied")

@login_required(login_url='/login')
def ticket_delete(request, project_id = None, ticket_id = None):
    if ticket_id:
        ticket = get_object_or_404(Ticket.objects.filter(id = ticket_id))
        project = get_object_or_404(Project.objects.filter(id = project_id))
        if project.owned_by_user(request.user) or ticket.owned_by_user(request.user):
            ticket.delete()
            return redirect('project_list_with_ticket', project_id ) # Redirect after POST
        else:
            return HttpResponse("Permission denied") 
    else:
        return render(request, 'ticket_list', ticket_id)

def login_user(request):
    if request.user.is_authenticated():
        return render(request, 'login/home.html')
    else:
        state = "Please log in below..."
        if request.POST:
            form = LoginForm(request.POST)
            if form.is_valid(): # All validation rules pass
                username_to_try = form.cleaned_data["username"]
                password_to_try = form.cleaned_data["password"]

                user = authenticate(username=username_to_try, password=password_to_try)
                if user is not None:
                    if user.is_active:
                        login(request, user)
                        return render(request, 'login/home.html', {'state':state})
                    else:
                        state = "Your account is not active, please contact the site admin."
                else:
                    state = "Your username and/or password were incorrect."
        else:
            form = LoginForm()
            return render(request, 'login/auth.html', {'state':state, 'form': form})

def logout_user(request):
    logout(request)
    state = "Please log in below..."
    form = LoginForm()
    return redirect('login_user')

def register_user(request):
    return render(request, 'login/register.html')