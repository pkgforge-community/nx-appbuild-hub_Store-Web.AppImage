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
from django.contrib import admin

from .model.package import Package
from .model.request import PackageRequest
from .model.group import PackageGroup
from .model.upload import PackageUpload

from .admins.package import PackageAdmin
from .admins.request import PackageRequestAdmin
from .admins.group import PackageGroupAdmin
from .admins.upload import PackageUploadAdmin

admin.site.register(Package, PackageAdmin)
admin.site.register(PackageRequest, PackageRequestAdmin)
admin.site.register(PackageGroup, PackageGroupAdmin)
admin.site.register(PackageUpload, PackageUploadAdmin)
