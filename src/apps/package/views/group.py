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

from apps.package.model.group import PackageGroup


class GroupView(TemplateView):
    @inject.params(package='package')
    def get(self, request, id=None, package=None):
        return render(request, "package/group.html", {
            'entity': PackageGroup.objects.get(id=id),
            'collection': package.groups(),
        })
