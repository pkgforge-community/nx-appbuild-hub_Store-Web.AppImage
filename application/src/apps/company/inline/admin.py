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
