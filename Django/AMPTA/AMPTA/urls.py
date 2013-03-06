from django.conf.urls import patterns, include, url
from django.conf import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
     
     url(r'^home/$', 'project_manager.views.home', name='home'),
    # url(r'^AMPTA/', include('AMPTA.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
     
    # Project urls below 
     url(r'^projects/$', 'project_manager.views.project_list', name='project_list'),

     url(r'^login/$', 'project_manager.views.login_user', name="login_user"),
     url(r'^logout/$', 'project_manager.views.logout_user', name="logout_user"),
     url(r'^signup/$', 'project_manager.views.register_user', name="register_user"),
     
     url(r'^project/(?P<project_id>\d+)$', 'project_manager.views.project_list', name='project_list_with_ticket'),
     url(r'^project/add$', 'project_manager.views.project_add', name='project_add'),
     url(r'^project/(?P<project_id>\d+)/edit$', 'project_manager.views.project_edit', name='project_edit'),
     url(r'^project/(?P<project_id>\d+)/delete$', 'project_manager.views.project_delete', name='project_delete'),

     url(r'^project/(?P<project_id>\d+)/ticket/(?P<ticket_id>\d+)$', 'project_manager.views.ticket_list', name='ticket_list'),
     url(r'^project/(?P<project_id>\d+)/ticket/add$', 'project_manager.views.ticket_add', name='ticket_add'),
     url(r'^project/(?P<project_id>\d+)/ticket/(?P<ticket_id>\d+)/delete$', 'project_manager.views.ticket_delete', name='ticket_delete'),
     url(r'^project/(?P<project_id>\d+)/ticket/(?P<ticket_id>\d+)/edit$', 'project_manager.views.ticket_edit', name='ticket_edit'),
    
    # Uncomment the next line to enable the admin:
     url(r'^admin/', include(admin.site.urls)),
     
     url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
)
