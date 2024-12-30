
from django.contrib import admin
from django.http import HttpResponse
from django.urls import path

def home(request):
    return HttpResponse("Welcome to new site")

def about(request):
    return HttpResponse("This project is to test ci/cd deployment to aws using github actions")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home, name='home'),
    path('about/', about, name='about'),
]
