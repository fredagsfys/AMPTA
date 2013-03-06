from project_manager.models import Ticket, Status, Project
from django.contrib import admin
from django.contrib.auth.models import User

class ProjectAdmin(admin.ModelAdmin):
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'owner':
            kwargs['queryset'] = User.objects.filter(username = request.user.username)
        return super(ProjectAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    def get_readonly_fields(self, request, obj=None):
        if obj is not None:
            return self.readonly_fields + ('owner',)
        return self.readonly_fields

    def add_view(self, request, form_url="", extra_context=None):
        data = request.GET.copy()
        data['owner'] = request.user
        request.GET = data
        return super(ProjectAdmin, self).add_view(request, form_url="", extra_context=extra_context)


admin.site.register(Ticket)
admin.site.register(Status)
admin.site.register(Project, ProjectAdmin)