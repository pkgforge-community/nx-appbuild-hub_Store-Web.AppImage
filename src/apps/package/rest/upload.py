# -*- coding: utf-8 -*-
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
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
