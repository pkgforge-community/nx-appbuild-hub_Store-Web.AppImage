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
from drf_yasg.utils import swagger_auto_schema
from rest_framework import mixins
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from apps.package.model.package import Package
from .serializer.package import PackageSerializer
from ..model.group import PackageGroup


class PackageViewSet(viewsets.GenericViewSet, mixins.RetrieveModelMixin):
    serializer_class = PackageSerializer
    permission_classes = []
    queryset = Package.objects
    lookup_value_regex = '.+'
    lookup_url_kwarg = "token"

    @swagger_auto_schema(tags=['API - package-maintainer'])
    def retrieve(self, request, *args, **kwargs):
        token = self.kwargs.get('token')
        if not token: raise Exception('Search string can not be empty')

        entity = self.queryset.get(token=token)
        if not entity: raise Exception('Package can not be empty')

        serializer = self.get_serializer(entity)
        return Response(serializer.data)


class PackageDeprecatedViewSet(viewsets.GenericViewSet, mixins.RetrieveModelMixin):
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

    @swagger_auto_schema(tags=['API - package-manager'])
    def retrieve(self, request, slug, *args, **kwargs):
        slug = self.kwargs.get('slug')
        if not slug: raise Exception('Search string can not be empty')

        entity = self.queryset.get(Q(slug=slug) | Q(package=slug))
        if not entity: raise Exception('Package can not be empty')

        serializer = self.get_serializer(entity, context={
            'request': request,
        })
        return Response(serializer.data)


class PackageListViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):
    serializer_class = PackageSerializer
    permission_classes = []
    queryset = Package.objects
    pagination_class = None
    lookup_value_regex = '.+'
    lookup_url_kwarg = "unique"

    def get_queryset(self, search=None):
        if search is None or not len(search):
            return self.queryset.all()
        return self.queryset.filter(Q(name__startswith=search) | Q(description__icontains=search))

    @swagger_auto_schema(tags=['API - package-manager'])
    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.query_params.get('search'))
        serializer = self.serializer_class(queryset, many=True, context={
            'request': self.request
        })

        return Response(serializer.data)

    @swagger_auto_schema(tags=['API - package-manager'], responses={
        200: PackageSerializer,
    })
    @action(url_path='by_group', methods=['get'], detail=True)
    def by_group(self, request, unique, *args, **kwargs):
        unique = self.kwargs.get('unique')
        if not unique: raise Exception('Search string can not be empty')

        collection = PackageGroup.objects.get(pk=unique).package_set.all()
        if not collection: raise Exception('Package can not be empty')

        return Response((PackageSerializer(collection, context={
            'request': request,
        }, many=True)).data)

    @swagger_auto_schema(tags=['API - package-manager'], responses={
        200: PackageSerializer,
    })
    @action(url_path='by_slug', methods=['get'], detail=True)
    def by_slug(self, request, unique, *args, **kwargs):
        slug = self.kwargs.get('unique')
        if not slug: raise Exception('Search string can not be empty')

        entity = self.queryset.get(Q(slug=slug) | Q(package=slug))
        if not entity: raise Exception('Package can not be empty')

        serializer = self.get_serializer(entity, context={
            'request': request,
        })
        return Response(serializer.data)
