# -*- coding: utf-8 -*-
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
import string
import random
from django.db import models
from .image import PackageImage
from .version import PackageVersion
from .comment import PackageComment


class Package(models.Model):
    name = models.CharField(max_length=100, unique=True)
    package = models.CharField(max_length=255, unique=True)
    slug = models.CharField(max_length=255, null=False, unique=True)
    token = models.CharField(max_length=255, null=False, unique=True)
    homepage = models.CharField(max_length=255, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    description = models.TextField(null=True, blank=True)

    icon = models.FileField(upload_to='package/icon/%Y/%m/%d/%H%M%S', null=True, blank=True)
    groups = models.ManyToManyField('PackageGroup', through='PackageGroupPackage')

    @property
    def image(self):
        return PackageImage.objects. \
            filter(package=self). \
            first()

    @property
    def images(self):
        return PackageImage.objects. \
            filter(package=self). \
            order_by('-id')

    @property
    def version(self):
        return PackageVersion.objects. \
            filter(package=self). \
            order_by('-id'). \
            first()

    @property
    def versions(self):
        return PackageVersion.objects. \
            filter(package=self). \
            order_by('-id')

    @property
    def comments(self):
        return PackageComment.objects. \
            filter(package=self). \
            order_by('-id')

    def __str__(self):
        return self.name
