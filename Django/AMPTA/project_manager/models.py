from django.db import models
from django.contrib.auth.models import User
from django.forms import ModelForm, DateField, extras
from django import forms 
datewid=forms.extras.widgets.SelectDateWidget()

class LoginForm(forms.Form):
    username = forms.CharField(max_length = 20)
    password = forms.CharField(max_length = 20, widget=forms.PasswordInput)
    class Meta:
        model = User

class Project(models.Model):
    
    name = models.CharField(max_length = 100)
    description = models.CharField(max_length = 250)
    start_date = models.DateField()
    end_date = models.DateField()
    owner = models.ForeignKey(User, related_name='owner')
    has_project = models.ManyToManyField(User, blank=True, related_name="has_project")
    
    def __unicode__(self):
        return self.name

    def owned_by_user(self, user):
        return self.owner == user
    def member_by_user(self, user):
        return user in self.has_project.all()

class ProjectForm(ModelForm):
    start_date = forms.DateField(widget = datewid)
    end_date = forms.DateField(widget = datewid)
    class Meta:
        model = Project
        exclude = ('owner')

class Status(models.Model):
    
    status_name = models.CharField(max_length = 20)
    
    def __unicode__(self):
        return self.status_name


class Ticket(models.Model):

    name = models.CharField(max_length = 100)
    description = models.CharField(max_length = 250)
    start_date = models.DateField()
    end_date = models.DateField()
    added_by_user = models.ForeignKey(User, related_name="tickets")
    projects = models.ForeignKey(Project, related_name="tickets")
    statuses = models.ForeignKey(Status, related_name="status")
    
    def __unicode__(self):
        return self.name

    def owned_by_user(self, user):
        return self.added_by_user == user

class TicketForm(ModelForm):
    start_date = forms.DateField(widget = datewid)
    end_date = forms.DateField(widget = datewid)
    class Meta:
        model = Ticket
        exclude = ('added_by_user', 'projects')