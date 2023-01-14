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
