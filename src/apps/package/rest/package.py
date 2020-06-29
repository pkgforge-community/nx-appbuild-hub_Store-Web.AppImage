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
