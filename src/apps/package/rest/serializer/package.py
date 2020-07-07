# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
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
