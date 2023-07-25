#from django.shortcuts import render
from rest_framework import viewsets

from api.serializers import BookSerializer, EventSerializer
from api.models import Book, Edition, Publisher, Event


class BookViewSet(viewsets.ModelViewSet):
    queryset = Book.objects.all().order_by('sku')
    serializer_class = BookSerializer

class EventViewSet(viewsets.ModelViewSet):
    queryset = Event.objects.all().order_by('date')
    serializer_class = EventSerializer