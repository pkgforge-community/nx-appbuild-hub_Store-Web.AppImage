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
import nested_admin

from ..models import Company
from ..models import CompanyPackageGroup


class CompanyAdminInline(nested_admin.NestedStackedInline):
    model = Company.admins.through
    extra = 1


class CompanyMemberInline(nested_admin.NestedStackedInline):
    model = Company.members.through
    extra = 1


class CompanyPackageGroupMemberInline(nested_admin.NestedStackedInline):
    model = CompanyPackageGroup.members.through
    extra = 1


class CompanyPackageGroupPackageInline(nested_admin.NestedStackedInline):
    model = CompanyPackageGroup.packages.through
    extra = 1


class CompanyPackageGroupInline(nested_admin.NestedStackedInline):
    model = CompanyPackageGroup
    extra = 1
