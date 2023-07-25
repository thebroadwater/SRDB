# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ArInternalMetadata(models.Model):
    key = models.CharField(primary_key=True)
    value = models.CharField(blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'ar_internal_metadata'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Authors(models.Model):
    name = models.TextField()
    sort_name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'authors'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Editions(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'editions'


class EventSources(models.Model):
    source = models.ForeignKey('Sources', models.DO_NOTHING, blank=True, null=True)
    event = models.ForeignKey('Events', models.DO_NOTHING, blank=True, null=True)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_sources'


class Events(models.Model):
    details = models.TextField(blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'events'


class GroupMembers(models.Model):
    group = models.ForeignKey('Groups', models.DO_NOTHING, blank=True, null=True)
    person = models.ForeignKey('People', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_members'


class GroupSources(models.Model):
    source = models.ForeignKey('Sources', models.DO_NOTHING)
    group = models.ForeignKey('Groups', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_sources'


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


class LocationSources(models.Model):
    source = models.ForeignKey('Sources', models.DO_NOTHING)
    location = models.ForeignKey('Locations', models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location_sources'


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


class PersonSources(models.Model):
    source = models.ForeignKey('Sources', models.DO_NOTHING)
    person = models.ForeignKey(People, models.DO_NOTHING)
    pages = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person_sources'


class PersonTags(models.Model):
    person = models.ForeignKey(People, models.DO_NOTHING, blank=True, null=True)
    tag = models.ForeignKey('Tags', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person_tags'


class Publishers(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'publishers'


class SchemaMigrations(models.Model):
    version = models.CharField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'schema_migrations'


class Sources(models.Model):
    title = models.TextField(blank=True, null=True)
    sku = models.TextField(blank=True, null=True)
    publication_date = models.DateField(blank=True, null=True)
    edition = models.ForeignKey(Editions, models.DO_NOTHING, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    reviewed = models.BooleanField(blank=True, null=True)
    own = models.BooleanField(blank=True, null=True)
    isbn10 = models.TextField(blank=True, null=True)
    pdfonly = models.BooleanField(blank=True, null=True)
    back_text = models.TextField(blank=True, null=True)
    author = models.TextField(blank=True, null=True)
    publisher = models.ForeignKey(Publishers, models.DO_NOTHING, blank=True, null=True)
    isbn13 = models.TextField(blank=True, null=True)
    game_date = models.DateField(blank=True, null=True)
    image_addr = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sources'


class Tags(models.Model):
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tags'


class Users(models.Model):
    email = models.CharField(unique=True)
    encrypted_password = models.CharField()
    reset_password_token = models.CharField(unique=True, blank=True, null=True)
    reset_password_sent_at = models.DateTimeField(blank=True, null=True)
    remember_created_at = models.DateTimeField(blank=True, null=True)
    sign_in_count = models.IntegerField()
    current_sign_in_at = models.DateTimeField(blank=True, null=True)
    last_sign_in_at = models.DateTimeField(blank=True, null=True)
    current_sign_in_ip = models.GenericIPAddressField(blank=True, null=True)
    last_sign_in_ip = models.GenericIPAddressField(blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    role_mask = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
