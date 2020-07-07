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
from django.db.models import Q
from rest_framework import mixins
from rest_framework import viewsets
from rest_framework.response import Response

from apps.package.model.package import Package
from .serializer.package import PackageSerializer


class PackageList(viewsets.GenericViewSet, mixins.RetrieveModelMixin, mixins.ListModelMixin):
    serializer_class = PackageSerializer
    permission_classes = []
    queryset = Package.objects
    pagination_class = None
    lookup_value_regex = '.+'
    lookup_url_kwarg = "slug"

    def get_queryset(self, search=None):
        if search is None or not len(search):
            return self.queryset.all()
        return self.queryset.filter(Q(name__startswith=search) | Q(description__icontains=search))

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.query_params.get('search'))
        serializer = self.serializer_class(queryset, many=True, context={
            'request': self.request
        })

        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        print(self.kwargs)
        slug = self.kwargs.get(self.lookup_url_kwarg)
        if slug is None or not len(slug):
            raise Exception('Search string can not be empty')

        entity = self.queryset.get(Q(slug=slug) | Q(package=slug))
        if entity is None or not entity:
            raise Exception('Package can not be empty')

        serializer = self.get_serializer(entity)
        return Response(serializer.data)
