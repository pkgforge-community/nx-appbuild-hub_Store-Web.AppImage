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
import hexdi
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic.base import TemplateView

from apps.package.services.package import ServicePackage


class PackageView(TemplateView):
    def get(self, request, slug):
        service_package: ServicePackage = hexdi.resolve('package')
        if not service_package: raise Exception('Unknown service')

        return render(request, "package/package.html", {
            'entity': service_package.package(slug),
            'collection': service_package.groups(),
        })


class PackageDownloadView(TemplateView):
    def get(self, request, slug):
        service_package: ServicePackage = hexdi.resolve('package')
        if not service_package: raise Exception('Unknown service')

        package = service_package.package(slug)
        if not package: raise Exception('package can not be empty')

        download_url = package.download
        if not download_url: raise Exception('download_url can not be empty')

        package.downloads += 1
        package.save(force_update=True)

        return HttpResponseRedirect(download_url)
