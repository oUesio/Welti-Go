from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Monster, MonsterType, Task, TaskType, Location, LocationType, TaskVerification
from django import forms

class LocationAdminForm(forms.ModelForm):
    class Meta:
        model = Location
        fields = '__all__'
        help_texts = {
            'task_slot1': 'Please ensure the first task slot contains a task of the type "quiz".',
        }

# Step 2: Custom admin class for the Location model using the custom form
class LocationAdmin(admin.ModelAdmin):
    form = LocationAdminForm
    # You can add more customization here

# Make sure to unregister the Location model if it was previously registered.
admin.site.register(Location, LocationAdmin)



admin.site.site_header = 'Admin Dashboard'
admin.site.site_title = 'Admin Dashboard'
admin.site.index_title = 'Welcome to Admin Dashboard'
admin.site.register(User, UserAdmin)
admin.site.register(Monster)
admin.site.register(MonsterType)
admin.site.register(Task)
admin.site.register(TaskType)
admin.site.register(LocationType)
admin.site.register(TaskVerification)