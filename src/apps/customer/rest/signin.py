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
from rest_framework.decorators import action

from ..models import Customer

from ..serializer import CustomerSigninSerializer


class CustomerSigninViewSet(viewsets.GenericViewSet):
    serializer_class = CustomerSigninSerializer
    queryset = Customer.objects
    pagination_class = None

    def get_queryset(self, data=None):
        return Customer.objects.get(email=data['email'])

    @action(detail=False, methods=['post'])
    def signin(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.data)
        serializer = self.get_serializer(queryset, many=False)
        return Response(serializer.data)
