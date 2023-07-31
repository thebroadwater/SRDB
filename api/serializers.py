#serializers.py

from rest_framework import serializers

from .models import Products, Editions, Publishers, Events, EventRefs

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = ('id', 'sku', 'name', 'isbn10')


class ProductRefSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = ('name')


class EventRefSerializer(serializers.ModelSerializer):
    product = serializers.StringRelatedField()
    class Meta:
        model = EventRefs
        fields = ('product_id', 'product', 'pages',)


class EventSerializer(serializers.ModelSerializer):
    ref = EventRefSerializer(source='eventrefs_set', many=True)

    class Meta:
        model = Events
        fields = ('id', 'date', 'details', 'ref')
        # fields = ('id', 'date', 'details')