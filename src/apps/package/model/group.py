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
from django.db import models


class PackageGroup(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    icon = models.FileField(upload_to='package/icon/%Y/%m/%d/')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    packages = models.ManyToManyField('Package', through='PackageGroupPackage')

    def __str__(self):
        return self.name


class PackageGroupPackage(models.Model):
    package = models.ForeignKey('package.Package', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('package.PackageGroup', null=False, blank=False, on_delete=models.CASCADE)
