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

from apps.package.model.group import PackageGroup


class PackageGroupDetailSerializer(serializers.HyperlinkedModelSerializer):
    unique = serializers.IntegerField(source='pk')
    # page = serializers.SerializerMethodField()
    packages = serializers.SerializerMethodField()

    class Meta:
        model = PackageGroup
        fields = [
            'name',
            'description',
            # 'page',
            'icon',
            'unique',
            'packages',
        ]

    def get_page(self, obj):
        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        return request.build_absolute_uri(
            reverse('package_group', args=(obj.pk,))
        )

    def get_packages(self, obj):
        from .package import PackageSerializer
        return PackageSerializer(obj.packages, context={
            'request': self.context.get('request')
        }, many=True).data


class PackageGroupSerializer(serializers.HyperlinkedModelSerializer):
    unique = serializers.IntegerField(source='pk')

    # page = serializers.SerializerMethodField()

    class Meta:
        model = PackageGroup
        fields = [
            'name',
            'description',
            # 'page',
            'icon',
            'unique'
        ]

    def get_page(self, obj):
        if 'request' not in self.context.keys():
            return None

        request = self.context.get('request')
        return request.build_absolute_uri(
            reverse('package_group', args=(obj.pk,))
        )
