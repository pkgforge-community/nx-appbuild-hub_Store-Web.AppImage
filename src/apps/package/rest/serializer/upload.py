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

from apps.package.model.upload import PackageUpload


class PackageUploadInitializeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = PackageUpload
        fields = ['file']


class PackageUploadSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = PackageUpload
        fields = '__all__'
