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
