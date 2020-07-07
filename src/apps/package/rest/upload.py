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
from chunked_upload.models import ChunkedUpload
from chunked_upload.views import ChunkedUploadCompleteView
from chunked_upload.views import ChunkedUploadView
from django.core.files.base import ContentFile
from rest_framework import viewsets
from rest_framework.decorators import action

from apps.customer.middleware import permissions
from apps.package.model.package import Package
from apps.package.model.upload import PackageUpload
from apps.package.model.version import PackageVersion
from .serializer.upload import PackageUploadInitializeSerializer
from .serializer.upload import PackageUploadSerializer


class PackageUploadView(viewsets.GenericViewSet, ChunkedUploadView):
    serializer_class = PackageUploadInitializeSerializer
    permission_classes = [permissions.IsAuthenticated]
    queryset = ChunkedUpload.objects
    model = PackageUpload
    pagination_class = None

    field_name = 'file'

    def get_queryset(self, request):
        return self.model.objects.all()

    def get_extra_attrs(self, request):
        if hasattr(request, 'customer'):
            return {'customer': request.customer}
        return {}

    def create_chunked_upload(self, save=False, **attrs):
        if 'user' in attrs: del attrs['user']
        entity = self.model(**attrs)
        entity.file.save(name='', content=ContentFile(''), save=save)
        return entity

    @action(detail=False, methods=['post'])
    def initialize(self, request, *args, **kwargs):
        return self._post(request, *args, **kwargs)


class PackageUploadCompleteView(viewsets.GenericViewSet, ChunkedUploadCompleteView):
    serializer_class = PackageUploadSerializer
    permission_classes = [permissions.IsAuthenticated]
    queryset = PackageUpload.objects
    model = PackageUpload

    @action(detail=False, methods=['post'])
    def finalize(self, request, *args, **kwargs):
        return self._post(request, *args, **kwargs)

    def get_queryset(self, request):
        return self.model.objects.all()

    @inject.params(config='config')
    def on_completion(self, uploaded_file, request, config=None):
        data = request.data
        if data is None:
            return data

        assert ('file' in data.keys())

        uploaded_file.name = data['file']
        package = Package.objects.get(token=data['token'])
        if package is None: return None

        PackageVersion.objects.create(
            description=data['description'],
            hash=data['md5'],
            name=data['name'],
            package=package,
            file=uploaded_file,
        )

        limit = int(config.get('package.history.limit', 3))
        print(limit)
        if limit is None or limit <= 0:
            return None

        for index, version in enumerate(package.versions, start=1):
            if index <= int(limit): continue
            version.delete()

    def get_response_data(self, chunked_upload, request):
        data = request.data
        if data is None:
            return data

        try:
            print(chunked_upload)
            chunked_upload.delete()
        except Exception as ex:
            print(ex)
            pass

        package = Package.objects.get(
            token=data['token']
        )

        if package is None:
            return None

        return {'success': True, 'package': {
            'description': data['description'],
            'package': package.name,
            'version': data['name'],
        }}
