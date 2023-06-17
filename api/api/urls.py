from django.urls import path
from django.contrib import admin

from app.views import upload_xml, upload_xml_task2

urlpatterns = [
    # path('', upload_xml),
    path('', upload_xml_task2),
    path('admin/', admin.site.urls),
]