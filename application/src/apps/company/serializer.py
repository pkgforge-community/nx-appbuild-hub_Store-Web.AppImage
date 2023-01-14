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
