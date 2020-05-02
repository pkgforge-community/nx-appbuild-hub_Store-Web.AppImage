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
from rest_framework import serializers

from apps.package.model.version import PackageVersion


class PackageVersionSerializer(serializers.HyperlinkedModelSerializer):
    file = serializers.SerializerMethodField()

    class Meta:
        model = PackageVersion
        fields = ['name', 'description', 'hash', 'file']

    def get_file(self, version):
        if version.file is None:
            return None

        assert ('request' in self.context.keys())
        return self.context['request']. \
            build_absolute_uri(version.file.url)
