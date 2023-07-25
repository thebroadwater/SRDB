#from django.shortcuts import render
from rest_framework import viewsets, mixins

from api.serializers import BookSerializer, EventSerializer
from api.models import Book, Edition, Publisher, Event


class BookViewSet(viewsets.ModelViewSet, mixins.RetrieveModelMixin):
    serializer_class = BookSerializer
    queryset = Book.objects.all().order_by('sku')
    filterset_fields = ['title', 'sku', 'id']    

class EventViewSet(viewsets.ModelViewSet, mixins.RetrieveModelMixin):
    queryset = Event.objects.all().order_by('date')
    serializer_class = EventSerializer
