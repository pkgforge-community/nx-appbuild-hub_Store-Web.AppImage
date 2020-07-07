# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
import os

from django.db import models
from django.dispatch import receiver


class PackageVersion(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=300)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    hash = models.CharField(max_length=255)

    downloads = models.IntegerField(null=True, blank=True, default=0)

    file = models.FileField(upload_to='package/version/%Y/%m/%d/%H%M%S')
    package = models.ForeignKey('package.Package', on_delete=models.CASCADE)

    @property
    def url(self):
        return self.file.url

    def __str__(self):
        return self.name


@receiver(models.signals.post_delete, sender=PackageVersion)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """
    if instance.file:
        if os.path.isfile(instance.file.path):
            os.remove(instance.file.path)
