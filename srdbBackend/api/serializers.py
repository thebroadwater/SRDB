#serializers.py

from rest_framework import serializers

from .models import Book, Edition, Publisher, Event, EventRef

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = ('id', 'sku', 'title')


class BookRefSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = ('title')


class EventRefSerializer(serializers.ModelSerializer):
    book = serializers.StringRelatedField()
    class Meta:
        model = EventRef
        fields = ('book_id', 'book','pages',)


class EventSerializer(serializers.ModelSerializer):
    ref = EventRefSerializer(source='eventref_set', many=True)

    class Meta:
        model = Event
        fields = ('id', 'date', 'details', 'ref')