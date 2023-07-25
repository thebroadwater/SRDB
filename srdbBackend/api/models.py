# import the standard Django Model
# from built-in library
from django.db import models
from datetime import datetime

class Edition(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'edition'


class Publisher(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'publisher'


class Book(models.Model):
    title = models.TextField(blank=True, null=True)
    sku = models.TextField(blank=True, null=True)
    publication_date = models.DateField(blank=True, null=True)
    edition = models.ForeignKey(Edition, models.DO_NOTHING, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    reviewed = models.BooleanField(blank=True, null=True)
    own = models.BooleanField(blank=True, null=True)
    isbn10 = models.TextField(blank=True, null=True)
    pdfonly = models.BooleanField(blank=True, null=True)
    back_text = models.TextField(blank=True, null=True)
    author = models.TextField(blank=True, null=True)
    publisher = models.ForeignKey(Publisher, models.DO_NOTHING, blank=True, null=True)
    isbn13 = models.TextField(blank=True, null=True)
    game_date = models.DateField(blank=True, null=True)
    image_addr = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'book'

    def __str__(self):
        return(self.title)


class Event(models.Model):
    details = models.TextField(blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    books = models.ManyToManyField('Book', through='EventRef')

    class Meta:
        managed = False
        db_table = 'event'


class EventRef(models.Model):
    book = models.ForeignKey('Book', models.DO_NOTHING, blank=True, null=True)
    event = models.ForeignKey('Event', models.DO_NOTHING, blank=True, null=True)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_ref'

    def __str__(self):
        return(self.pages)



class GroupMember(models.Model):
    group = models.ForeignKey('Group', models.DO_NOTHING, blank=True, null=True)
    person = models.ForeignKey('People', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_member'


class GroupRef(models.Model):
    book = models.ForeignKey('Book', models.DO_NOTHING)
    group = models.ForeignKey('Group', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_ref'


class GroupTag(models.Model):
    group = models.ForeignKey('Group', models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tag', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_tag'


class Group(models.Model):
    name = models.TextField(blank=True, null=True)
    kind = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    subtype = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group'


class LocationRef(models.Model):
    book = models.ForeignKey('Book', models.DO_NOTHING)
    location = models.ForeignKey('Location', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location_ref'


class LocationTag(models.Model):
    location = models.ForeignKey('Location', models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tag', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location_tag'


class Location(models.Model):
    name = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    kind = models.TextField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    city = models.TextField(blank=True, null=True)
    country = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location'


class People(models.Model):
    name = models.TextField(blank=True, null=True)
    affiliation = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    metatype = models.TextField(blank=True, null=True)
    bluf = models.TextField(blank=True, null=True)
    active = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'people'


class PersonRef(models.Model):
    book = models.ForeignKey(Book, models.DO_NOTHING)
    person = models.ForeignKey(People, models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person_ref'


class PersonTag(models.Model):
    person = models.ForeignKey(People, models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tag', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person_tag'


class Tag(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tag'