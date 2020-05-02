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
from django.urls import reverse
from rest_framework import serializers
from apps.package.model.package import Package
from .version import PackageVersionSerializer


class PackageSerializer(serializers.HyperlinkedModelSerializer):
    versions = PackageVersionSerializer(many=True, read_only=True)
    version = serializers.SerializerMethodField()
    file = serializers.SerializerMethodField()
    hash = serializers.SerializerMethodField()

    class Meta:
        model = Package
        fields = ['name', 'slug', 'version', 'description', 'hash', 'package', 'file', 'versions']

    def get_version(self, obj):
        version = obj.version
        if version is None: return None
        if version.file is None: return None
        return version.name

    def get_hash(self, obj):
        version = obj.version
        if version is None: return None
        if version.file is None: return None
        return version.hash

    def get_file(self, obj):
        assert ('request' in self.context.keys())
        return self.context['request'].build_absolute_uri(
            reverse('package_download', args=(obj.slug,))
        )
