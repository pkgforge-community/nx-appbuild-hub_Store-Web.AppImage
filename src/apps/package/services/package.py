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


class ServicePackage(object):

    def __init__(self):
        from ..model.package import Package
        self.queryset = Package.objects

    def search(self, string):
        from django.db.models import Q

        return self.queryset.filter(
            Q(description__icontains=string) |
            Q(name__icontains=string)
        ).all()

    def count(self):
        return self.queryset. \
            count()

    def random(self, limit=None):
        if limit is None or limit == 1:
            return self.queryset. \
                order_by("?"). \
                first()

        return self.queryset. \
                   order_by("?"). \
                   all()[:limit]
