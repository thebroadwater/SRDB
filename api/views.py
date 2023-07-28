from rest_framework import viewsets, mixins
from rest_framework.response import Response

from api.serializers import ProductSerializer, EventSerializer
from api.models import Products, Editions, Publishers, Events


class ProductViewSet(mixins.RetrieveModelMixin, 
                   mixins.ListModelMixin,
                   viewsets.GenericViewSet):
    queryset = Products.objects.all().order_by('name')
    serializer_class = ProductSerializer
    filterset_fields = ['name', 'sku', 'id', 'own']    


class EventViewSet(mixins.RetrieveModelMixin, 
                   mixins.ListModelMixin,
                   viewsets.GenericViewSet):
    queryset = Events.objects.all().order_by('date')
    serializer_class = EventSerializer
 