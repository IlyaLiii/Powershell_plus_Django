from django.db import models

class Xml_receiver(models.Model):
    name = models.CharField(max_length=100)
    file = models.FileField()
    receive_date = models.DateTimeField("date receive")
