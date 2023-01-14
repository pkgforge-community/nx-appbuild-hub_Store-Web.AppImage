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
