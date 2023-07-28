from rest_framework import viewsets
from rest_framework.response import Response

from api.serializers import ProductSerializer, EventSerializer
from api.models import Products, Editions, Publishers, Events


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Products.objects.all().order_by('sku')
    serializer_class = ProductSerializer
    filterset_fields = ['name', 'sku', 'id', 'own']    


class EventViewSet(viewsets.ModelViewSet):
    queryset = Events.objects.all().order_by('date')
    serializer_class = EventSerializer
 