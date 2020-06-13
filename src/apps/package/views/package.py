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
import os
from django.urls import reverse
from django.http import FileResponse
from wsgiref.util import FileWrapper

from django.shortcuts import render
from django.views.generic.base import TemplateView

from apps.package.model.package import Package


class PackageView(TemplateView):
    def get(self, request, id=None):
        if id is None or not len(id):
            raise Exception('id can not be empty')

        return render(request, "package/package.html", {
            'entity': Package.objects.get(id=id)
        })


class PackageDownloadView(TemplateView):
    def get(self, request, slug=None):

        if slug is None or not len(slug):
            raise Exception('slug can not be empty')

        package = Package.objects.get(slug=slug)
        if package is None or not package:
            raise Exception('package can not be empty')

        version = package.version
        if version is None or not version:
            raise Exception('package version can not be empty')

        version.downloads += 1
        version.save(force_update=True)

        version_file = version.file
        if version_file is None or not version_file:
            raise Exception('package version can not be empty')

        response = FileResponse(FileWrapper(open(version_file.path, 'rb')), as_attachment=True)
        response["Content-Disposition"] = 'attachment; filename="{}"'.format(package.package)
        response["Content-Length"] = os.path.getsize(version_file.path)

        return response
