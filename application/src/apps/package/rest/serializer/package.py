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
from datetime import datetime

from django.urls import reverse
from rest_framework import serializers

from apps.package.model.package import Package
from .image import PackageImageSerializer
from .version import PackageVersionSerializer
from ...model.version import PackageVersion


class PackageSerializer(serializers.HyperlinkedModelSerializer):
    versions = PackageVersionSerializer(many=True, read_only=True)
    images = PackageImageSerializer(many=True, read_only=True)

    groups = serializers.SerializerMethodField()
    version = serializers.SerializerMethodField()
    file = serializers.SerializerMethodField()
    hash = serializers.SerializerMethodField()
    icon = serializers.SerializerMethodField()
    preview = serializers.SerializerMethodField()
    page = serializers.SerializerMethodField()
    page_home = serializers.SerializerMethodField()
    page_source = serializers.SerializerMethodField()

    updated_at = serializers.SerializerMethodField()

    class Meta:
        model = Package
        fields = [
            'name',
            'slug',
            'version',
            'description',
            'updated_at',
            'hash',
            'package',
            'icon',
            'preview',
            'file',
            'page',
            'page_home',
            'page_source',
            'versions',
            'groups',
            'images'
        ]

    def get_updated_at(self, obj: Package):
        latest: PackageVersion = obj.version
        if latest is None or latest.created is None:
            return None

        return datetime.timestamp(latest.created)

    def get_groups(self, obj):
        from .group import PackageGroupSerializer
        return PackageGroupSerializer(obj.groups, context={
            'request': self.context.get('request')
        }, many=True).data

    def get_version(self, obj: Package):
        version = obj.version
        if version is None: return None
        if version.file is None: return None
        return version.name

    def get_hash(self, obj: Package):
        version = obj.version
        if version is None: return None
        if version.file is None: return None
        return version.hash

    def get_file(self, obj: Package):
        if obj.download is not None:
            return obj.download
        
        if obj.version is None: return None

        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        return request.build_absolute_uri(
            reverse('package_download', args=(obj.slug,))
        )

    def get_page(self, obj: Package):
        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        return request.build_absolute_uri(
            reverse('package', args=(obj.slug,))
        )

    def get_page_home(self, obj: Package):
        return obj.homepage

    def get_page_source(self, obj: Package):
        return obj.repository

    def get_icon(self, obj: Package):
        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        if not request: return None

        image = obj.icon
        if not image: return None

        return request.build_absolute_uri(image.url)

    def get_preview(self, obj: Package):
        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        if not request: return None

        image = obj.image
        if not image: return None

        return request.build_absolute_uri(image.url)
