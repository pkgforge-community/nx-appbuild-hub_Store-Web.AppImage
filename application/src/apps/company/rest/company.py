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
from rest_framework import viewsets
from rest_framework.response import Response

from ..models import Company
from ..serializer import CompanySerializer


class CompanyList(viewsets.GenericViewSet):
    serializer_class = CompanySerializer
    queryset = Company.objects
    pagination_class = None

    def get_queryset(self, search=None):
        if search is None or not len(search):
            return self.queryset.all()

        return self.queryset. \
            filter(name__contains=search)

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(request.query_params.get('search'))
        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)
