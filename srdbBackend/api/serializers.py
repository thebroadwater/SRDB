#serializers.py

from rest_framework import serializers

from .models import Products, Editions, Publishers, Events, EventRefs, Ephemera

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = ('id', 'sku', 'name')


class ProductRefSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = ('name')


class EventRefSerializer(serializers.ModelSerializer):
    book = serializers.StringRelatedField()
    class Meta:
        model = EventRefs
        fields = ('product_id', 'product','pages',)


class EventSerializer(serializers.ModelSerializer):
    ref = EventRefSerializer(source='eventrefs_set', many=True)

    class Meta:
        model = Events
        fields = ('id', 'date', 'details', 'ref')


class EphmeraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ephemera
        fields = ('name',)