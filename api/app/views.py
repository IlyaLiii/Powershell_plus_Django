import datetime
from .models import Xml_receiver
from django.http import HttpResponse

BASE_PATH_FILES = 'C:\projects\pythonProject\Powershell_plus_Django\api\files'


def upload_xml(request):
    if request.method == 'POST':
        with open(f"./files/{request.headers['name']}", 'wb') as file:
            file.write(request.body)
        return HttpResponse()
    else:
        return HttpResponse('test')


def upload_xml_task2(request):
    if request.method == 'POST':
        name = request.headers['name']
        with open(f"./files/{request.headers['name']}", 'wb') as file:
            file.write(request.body)
        file = BASE_PATH_FILES + '\\' + str(name)
        receive_date = datetime.datetime.now()
        xml = Xml_receiver.objects.create(name=name,
                                          file=file,
                                          receive_date=receive_date)
        xml.save()
        return HttpResponse()
    else:
        return HttpResponse('test2')
