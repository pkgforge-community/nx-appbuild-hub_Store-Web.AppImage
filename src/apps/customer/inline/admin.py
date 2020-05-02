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

from ..models import Customer
from ..models import CustomerGroupInvite
from ..models import CustomerToken
from ..models import CustomerGroup


class CustomerPackageInline(nested_admin.NestedStackedInline):
    model = Customer.packages.through
    extra = 1


class CustomerGroupPackageInline(nested_admin.NestedStackedInline):
    model = CustomerGroup.packages.through
    extra = 1


class CustomerGroupMemberInline(nested_admin.NestedStackedInline):
    model = CustomerGroup.members.through
    extra = 1


class CustomerGroupAdminInline(nested_admin.NestedStackedInline):
    model = CustomerGroup.admins.through
    extra = 1


class CustomerMemberGroupInline(nested_admin.NestedStackedInline):
    model = Customer.member_groups.through
    extra = 1


class CustomerAdminGroupInline(nested_admin.NestedStackedInline):
    model = Customer.admin_groups.through
    extra = 1


class CustomerMemberCompanyInline(nested_admin.NestedStackedInline):
    model = Customer.member_companies.through
    extra = 1


class CustomerMemberCompanyGroupInline(nested_admin.NestedStackedInline):
    model = Customer.member_company_groups.through
    extra = 1


class CustomerAdminCompanyInline(nested_admin.NestedStackedInline):
    model = Customer.admin_companies.through
    extra = 1


class CustomerGroupInviteInline(nested_admin.NestedStackedInline):
    model = CustomerGroupInvite
    extra = 1


class CustomerTokenInline(nested_admin.NestedStackedInline):
    model = CustomerToken
    extra = 1


class CustomerGroupInline(nested_admin.NestedStackedInline):
    model = CustomerGroup
    extra = 1
