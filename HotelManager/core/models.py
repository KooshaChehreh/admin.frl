from django.db import models
from .managers import BaseManager
from django.utils import timezone


class BaseModel(models.Model):
    class Meta:
        abstract = True

    objects = BaseManager()

    created_at = models.DateTimeField(auto_now_add=True, editable=False, verbose_name='Created at', null=True)
    updated_at = models.DateTimeField(auto_now=True, editable=False, verbose_name='Updated at', null=True)

    deleted_at = models.DateTimeField(
        null=True,
        blank=True,
        editable=False,
        verbose_name='Deleted datetime',
        help_text='This is deleted datetime'
    )

    restored_at = models.DateTimeField(
        null=True,
        blank=True,
        editable=False,
        verbose_name='Restored Datetime',
        help_text='This is Restored Datetime'
    )

    is_deleted = models.BooleanField(
        null=True,
        default=False,
        editable=False,
        db_index=True,
        verbose_name='Deleted status',
        help_text='This is deleted status'
    )

    is_active = models.BooleanField(
        null=True,
        default=True,
        editable=False,
        verbose_name='Active status',
        help_text='This is active status'
    )

    def deleter(self, using=None, keep_parents=False):
        self.deleted_at = timezone.now()
        self.is_deleted = True
        self.save(using=using)

    def restore(self):
        self.restored_at = timezone.now()
        self.is_deleted = False
        self.save()

    def deactivate(self):
        self.is_active = False
        self.save()

    def activate(self):
        self.is_active = True
        self.save()
