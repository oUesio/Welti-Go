from django.urls import path
from . import views
from rest_framework import routers
from django.urls import path
from . import views
# For built-in DRF authentication and authorisation
from rest_framework.authtoken.views import obtain_auth_token
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    
    # Test page
    path('hello/', views.HelloView.as_view(), name='hello'),

    path('api/collection/', views.CollectionView.as_view(), name='collection'),

    # Enables DRF built-in 'sign in' view
    path('api/login/', obtain_auth_token, name='api_token_auth'),

    # # Enable custom ObtainAuthToken 'sign in' view
    # path('api/login/', views.ObtainAuthToken.as_view(), name='login'),

    # Enables the 'log out' view, which deletes the auth token
    path('api/logout/', views.LogoutView.as_view(), name='logout'),
    path('api/location/<int:location_id>/', views.LocationView.as_view()),
    path('api/task-send/', views.CreateTaskVerification.as_view(), name='task-send'),
]

# If in debug mode, serve media files, otherwise change this to a proper media server
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

router = routers.SimpleRouter()
router.register(r'api/signup', viewset=views.UserListCreate)
urlpatterns += router.urls
