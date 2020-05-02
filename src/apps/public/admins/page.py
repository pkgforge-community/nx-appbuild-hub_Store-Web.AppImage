#!/usr/bin/env python
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
from ..models import PublicPage
from django.contrib import admin

from ckeditor.widgets import CKEditorWidget
from django import forms


# https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css
class PublicPageForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget())

    class Meta:
        model = PublicPage
        fields = ['name', 'path', 'content', 'enabled', 'description', 'keywords']


@admin.register(PublicPage)
class PublicPageAdmin(admin.ModelAdmin):
    form = PublicPageForm
    list_display = ['name', 'path', 'enabled', 'keywords']

    fieldsets = (
        ('Main', {
            'fields': (
                'name',
                'path',
                'enabled'
            )
        }),
        ('Contend', {
            'fields': (
                'content',
            )
        }),
        ('Properties', {
            'fields': (
                'keywords',
                'description',
            )
        }),
    )
