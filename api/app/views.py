from django.http import HttpResponse


def upload_xml(request):
    if request.method == 'POST':
        with open(f"./files/{request.headers['name']}", 'wb') as file:
            file.write(request.body)
        return HttpResponse()
    else:
        return HttpResponse('test')
