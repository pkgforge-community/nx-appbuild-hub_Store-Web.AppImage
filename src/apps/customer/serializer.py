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
from importlib import util
from rest_framework import serializers

from .models import Customer
from .models import CustomerGroup
from .models import CustomerToken


class CustomerTokenSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CustomerToken
        fields = ['token']


class CustomerSigninSerializer(serializers.Serializer):
    password = serializers.Field(write_only=True)
    email = serializers.Field(write_only=True)
    token = serializers.SerializerMethodField()

    class Meta:
        fields = ['email', 'password', 'token']
        model = Customer
        extra_kwargs = {
            'password': {'write_only': True},
            'email': {'write_only': True},
        }

    def get_token(self, customer):
        serializer = CustomerTokenSerializer(customer.token, many=False)
        return serializer.data


class CustomerGroupSerializer(serializers.HyperlinkedModelSerializer):
    packages = serializers.SerializerMethodField()

    class Meta:
        model = CustomerGroup
        fields = ['name', 'description', 'packages']

    def get_packages(self, group):
        spec = util.find_spec('apps.package.serializer')
        module = spec.loader.load_module()

        serializer = module.PackageSerializer(group.packages, many=True)
        return serializer.data


class CustomerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Customer
        fields = ['first_name', 'last_name', 'last_name', 'email']
