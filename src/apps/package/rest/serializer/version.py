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
from rest_framework import serializers

from apps.package.model.version import PackageVersion


class PackageVersionCreateSerializer(serializers.HyperlinkedModelSerializer):
    package = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = PackageVersion
        fields = ['name', 'description', 'hash', 'ipfs_cid', 'ipfs_gateway', 'package']

    def get_package(self, value):
        from apps.package.rest.serializer.package import PackageSerializer

        return PackageSerializer(value.package, context={
            'request': self.context.get('request')
        }).data


class PackageVersionSerializer(serializers.HyperlinkedModelSerializer):
    file = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = PackageVersion
        fields = ['name', 'description', 'hash', 'file', 'ipfs_cid', 'ipfs_gateway']

    def get_file(self, version):
        if not version.file: return None

        assert ('request' in self.context.keys())

        request = self.context.get('request')
        if not request: return None

        return request.build_absolute_uri(version.file.url)
