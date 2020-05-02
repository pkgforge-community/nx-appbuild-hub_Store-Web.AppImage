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
from django.shortcuts import render
from django.views.generic.base import TemplateView

from apps.package.model.group import PackageGroup


class GroupView(TemplateView):
    def get(self, request, id=None):
        return render(request, "package/group.html", {
            'entity': PackageGroup.objects.get(id=id)
        })
