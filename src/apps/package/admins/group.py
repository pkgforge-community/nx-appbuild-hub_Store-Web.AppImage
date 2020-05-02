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
from django.utils.safestring import mark_safe

from .inline.group import GroupPackageInline


class PackageGroupAdmin(admin.ModelAdmin):
    list_display = ['name', 'description', 'preview', 'created']
    search_fields = ('icon', 'name', 'description')
    readonly_fields = ["preview"]
    inlines = [GroupPackageInline]

    def preview(self, entity):
        return mark_safe('<img src="{url}" width="{width}" height="{height}" />'.format(
            url=entity.icon.url, width=100, height=100,
        ))
