from django.db import models

class LoadStorage(models.Model):
    id=models.IntegerField(auto_created=True,primary_key=True)
    email=models.CharField(max_length=1000)
    mobile=models.CharField(max_length=1000)
    password=models.CharField(max_length=200,default="Nothing")
    address=models.CharField(max_length=200,default="Nothing")
    name=models.CharField(max_length=100,default="Nothing")
    userId=models.IntegerField(default=0)

    def __str__(self):
        return self.email


class ImageModel(models.Model):
    image_base64=models.TextField()
    time=models.CharField(max_length=200)


    def __str__(self):
        return self.time