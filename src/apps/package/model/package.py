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
from django.db import models

from .comment import PackageComment
from .image import PackageImage
from .version import PackageVersion


class PackageModelManager(models.Manager):

    def get_queryset(self):
        return super().get_queryset(). \
            prefetch_related('package__version_set'). \
            prefetch_related('package__image_set'). \
            prefetch_related('package__comment_set'). \
            prefetch_related('groups')


class Package(models.Model):
    name = models.CharField(max_length=100, unique=True)
    package = models.CharField(max_length=255, unique=True)
    slug = models.CharField(max_length=255, null=False, unique=True)
    token = models.CharField(max_length=255, null=False, unique=True)
    homepage = models.CharField(max_length=255, null=True, blank=True)
    repository = models.CharField(max_length=255, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    description = models.TextField(null=True, blank=True)

    icon = models.FileField(upload_to='package/icon/%Y/%m/%d/%H%M%S', null=True, blank=True)
    groups = models.ManyToManyField('PackageGroup', through='PackageGroupPackage')

    objects = PackageModelManager()

    @property
    def image(self):
        return PackageImage.objects. \
            filter(package=self). \
            first()

    @property
    def images(self):
        return self.packageimage_set. \
            order_by('-id')

    @property
    def version(self):
        return PackageVersion.objects. \
            filter(package=self). \
            order_by('-id'). \
            first()

    @property
    def versions(self):
        return self.packageversion_set. \
            order_by('-id')

    @property
    def comments(self):
        return PackageComment.objects. \
            filter(package=self). \
            order_by('-id')

    def __str__(self):
        return self.name
