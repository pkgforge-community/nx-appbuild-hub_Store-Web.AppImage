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

from ..models import CustomerGroup

from ..serializer import CustomerGroupSerializer


class CustomerGroupList(viewsets.GenericViewSet):
    serializer_class = CustomerGroupSerializer
    queryset = CustomerGroup.objects
    pagination_class = None

    def get_queryset(self, search=None):
        if search is None or not len(search):
            return CustomerGroup.objects.all()

        return CustomerGroup.objects. \
            filter(name=search)

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.query_params.get('search'))
        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)
