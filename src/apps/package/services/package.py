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
class ServicePackage(object):

    def __init__(self):
        from ..model.package import Package
        self.queryset = Package.objects

    def search(self, string):
        from django.db.models import Q

        return self.queryset.filter(
            Q(description__icontains=string) |
            Q(name__icontains=string)
        ).all()

    def count(self):
        return self.queryset. \
            count()

    def groups(self):
        from ..model.group import PackageGroup
        return PackageGroup.objects.all()

    def random(self, limit=None):
        if limit is None or limit == 1:
            return self.queryset. \
                order_by("?"). \
                first()

        return self.queryset. \
                   order_by("?"). \
                   all()[:limit]
