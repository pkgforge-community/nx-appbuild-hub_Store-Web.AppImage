# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
import os
from wsgiref.util import FileWrapper

from django.http import FileResponse
from django.shortcuts import render
from django.views.generic.base import TemplateView

from apps.package.model.package import Package
from django.http import HttpResponse


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

        response = FileResponse(open(version_file.path, 'rb'), as_attachment=False)
        response["Content-Disposition"] = 'attachment; filename="{}"'.format(package.package)
        response["Content-Length"] = os.path.getsize(version_file.path)

        return response
