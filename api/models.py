# import the standard Django Model
# from built-in library
import uuid
from django.db import models
from datetime import datetime

class Editions(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'editions'


class Publishers(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'publishers'


class Products(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField(blank=True, null=True)
    sku = models.TextField(blank=True, null=True)
    edition = models.ForeignKey('Editions', models.DO_NOTHING, blank=True, null=True)
    publisher = models.ForeignKey('Publishers', models.DO_NOTHING, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    isbn10 = models.TextField(blank=True, null=True)
    isbn13 = models.TextField(blank=True, null=True)
    publication_date = models.DateField(blank=True, null=True)
    game_date = models.DateField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)   
    own = models.BooleanField(blank=True, null=False)
    reviewed = models.BooleanField(blank=True, null=True)
    pdfonly = models.BooleanField(blank=True, null=True)
    image_addr = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)


    class Meta:
        managed = False
        db_table = 'products'

    def __str__(self):
        return(self.name)


class Events(models.Model):
    details = models.TextField(blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    product = models.ManyToManyField('Products', through='EventRefs')

    class Meta:
        managed = False
        db_table = 'events'


class EventRefs(models.Model):
    product = models.ForeignKey('Products', models.DO_NOTHING, blank=True, null=True)
    event = models.ForeignKey('Events', models.DO_NOTHING, blank=True, null=True)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_refs'

    def __str__(self):
        return(self.pages)



class GroupMembers(models.Model):
    group = models.ForeignKey('Groups', models.DO_NOTHING, blank=True, null=True)
    person = models.ForeignKey('People', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_members'


class GroupRefs(models.Model):
    product = models.ForeignKey('Products', models.DO_NOTHING)
    group = models.ForeignKey('Groups', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_refs'


class GroupTags(models.Model):
    group = models.ForeignKey('Groups', models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tags', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_tags'


class Groups(models.Model):
    name = models.TextField(blank=True, null=True)
    kind = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    subtype = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'groups'


class LocationRefs(models.Model):
    product = models.ForeignKey('Products', models.DO_NOTHING)
    location = models.ForeignKey('Locations', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location_refs'


class LocationTags(models.Model):
    location = models.ForeignKey('Locations', models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tags', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location_tags'


class Locations(models.Model):
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
        db_table = 'locations'


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


class PeopleRefs(models.Model):
    product = models.ForeignKey('Products', models.DO_NOTHING)
    person = models.ForeignKey('People', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'people_refs'


class PeopleTags(models.Model):
    person = models.ForeignKey('People', models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tags', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'people_tags'


class Tags(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tags'

