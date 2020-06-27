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
from django.shortcuts import render
from django.views.generic.base import TemplateView


class DashboardView(TemplateView):
    @inject.params(package='package')
    def get(self, request, search=None, package=None):
        search = request.GET.get('search')
        if search is not None and len(search):
            return self.search(request, search)

        return self.dashboard(request)

    @inject.params(package='package')
    def dashboard(self, request, package=None):
        return render(request, "package/dashboard.html", {
            'total': package.count()
        })

    @inject.params(package='package')
    def search(self, request, search=None, package=None):
        return render(request, "package/search.html", {
            'collection': package.search(search),
            'request': search
        })
