from django.urls import path

from app.views import upload_xml

urlpatterns = [
    path('', upload_xml),
]