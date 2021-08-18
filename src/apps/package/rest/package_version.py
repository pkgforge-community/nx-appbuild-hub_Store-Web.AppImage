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
from drf_yasg.utils import swagger_auto_schema
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from apps.package.model.package import Package
from apps.package.model.version import PackageVersion
from apps.package.rest.serializer.version import PackageVersionCreateSerializer
from apps.package.rest.serializer.version import PackageVersionSerializer


class PackageVersionViewSet(viewsets.GenericViewSet):
    serializer_class = PackageVersionCreateSerializer
    permission_classes = []
    queryset = PackageVersion.objects
    pagination_class = None
    lookup_value_regex = '.+'
    lookup_url_kwarg = "token"

    @swagger_auto_schema(tags=['API - package-maintainer'], responses={
        200: PackageVersionSerializer,
    }, request_body=PackageVersionSerializer)
    @action(url_path='create', methods=['post'], detail=True)
    def create_new_version(self, request, token=None):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        version_presented = PackageVersion.objects.filter(
            ipfs_cid=serializer.validated_data.get('ipfs_cid'),
            package=Package.objects.get(token=token),
        )

        if version_presented: raise ValueError('Existed version')

        return Response(self.serializer_class(instance=PackageVersion.objects.create(
            package=Package.objects.get(token=token),
            name=serializer.validated_data.get('name'),
            description=serializer.validated_data.get('description'),
            ipfs_gateway=serializer.validated_data.get('ipfs_gateway'),
            ipfs_cid=serializer.validated_data.get('ipfs_cid'),
            hash=serializer.validated_data.get('hash'),
        ), context={
            'request': self.request
        }).data)
