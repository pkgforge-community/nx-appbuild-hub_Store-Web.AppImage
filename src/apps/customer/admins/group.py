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
from importlib import util

from django.contrib import admin

spec = util.find_spec('apps.customer.inline.admin')
inline = spec.loader.load_module()


class CustomerGroupAdmin(admin.ModelAdmin):
    list_display = ['name', 'created', 'description']
    inlines = [inline.CustomerGroupPackageInline, inline.CustomerGroupMemberInline, inline.CustomerGroupAdminInline]
