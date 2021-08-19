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
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic.base import TemplateView

import inject
from apps.package.model.package import Package


class PackageView(TemplateView):
    @inject.params(package='package')
    def get(self, request, slug=None, package=None):
        if not len(slug): raise ValueError('id can not be empty')

        return render(request, "package/package.html", {
            'entity': Package.objects.get(slug=slug),
            'collection': package.groups(),
        })


class PackageDownloadView(TemplateView):
    def get(self, request, slug=None):
        if not slug or not len(slug):
            raise Exception('slug can not be empty')

        package = Package.objects.get(slug=slug)
        if not package: raise Exception('package can not be empty')

        version = package.version
        if not version: raise Exception('package version can not be empty')

        version.downloads += 1
        version.save(force_update=True)

        return HttpResponseRedirect(version.url)
