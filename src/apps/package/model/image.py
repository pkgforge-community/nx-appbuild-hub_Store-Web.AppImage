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


class PackageImage(models.Model):
    image = models.FileField(upload_to='package/image/%Y/%m/%d/%H%M%S')
    created = models.DateTimeField(auto_now_add=True)

    package = models.ForeignKey('package.Package', on_delete=models.CASCADE)

    @property
    def url(self):
        return self.image.url

    def __str__(self):
        return self.image.name
