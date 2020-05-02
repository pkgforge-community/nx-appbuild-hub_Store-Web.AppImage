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
import inject
from apps.widgets import widget
from django.template.loader import render_to_string


@widget(name='dashboard.search')
def search(request=None):
    return render_to_string("package/widget/search.html", {
        'poll': 'test'
    })


@widget(name='dashboard.latest')
@inject.params(package='package')
def latest(request=None, package=None):
    return render_to_string("package/widget/latest.html", {
        'collection': package.random(2)
    })


@widget(name='dashboard.featured')
@inject.params(package='package')
def featured(request=None, package=None):
    return render_to_string("package/widget/featured.html", {
        'package': package.random()
    })


@widget(name='dashboard.popular')
@inject.params(package='package')
def popular(request=None, package=None):
    return render_to_string("package/widget/popular.html", {
        'collection': package.random(2)
    })


@widget(name='dashboard.sidebar')
@inject.params(package='package')
def sidebar(request=None, package=None):
    from apps.package.model.group import PackageGroup
    return render_to_string("package/widget/sidebar.html", {
        'collection': PackageGroup.objects.all()
    })
