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
from rest_framework import viewsets
from rest_framework.response import Response

from apps.package.model.group import PackageGroup
from .serializer.group import PackageGroupSerializer


class PackageGroupList(viewsets.GenericViewSet):
    serializer_class = PackageGroupSerializer
    queryset = PackageGroup.objects
    pagination_class = None

    def get_queryset(self, search=None):
        if search is not None and len(search):
            return PackageGroup.objects. \
                filter(name=search)

        return PackageGroup.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.query_params.get('search'))
        serializer = self.serializer_class(queryset, many=True, context={
            'request': self.request
        })
        return Response(serializer.data)
