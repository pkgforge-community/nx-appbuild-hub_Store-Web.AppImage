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

from .models import Company
from .models import CompanyPackageGroup


class CompanySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Company
        fields = ['name', 'description']


class CompanyPackageGroupSerializer(serializers.HyperlinkedModelSerializer):
    packages = serializers.SerializerMethodField()

    class Meta:
        model = CompanyPackageGroup
        fields = ['name', 'description', 'packages']

    def get_packages(self, group):
        spec = util.find_spec('apps.package.serializer')
        module = spec.loader.load_module()

        serializer = module.PackageSerializer(group.packages, many=True)
        return serializer.data
