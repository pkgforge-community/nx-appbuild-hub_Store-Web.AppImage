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
from django.contrib import admin

from .models import Company
from .models import CompanyPackageGroup
from .models import CompanyInviteCustomer

from .inline.admin import CompanyAdminInline
from .inline.admin import CompanyMemberInline
from .inline.admin import CompanyPackageGroupMemberInline
from .inline.admin import CompanyPackageGroupPackageInline
from .inline.admin import CompanyPackageGroupInline


class CompanyAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'icon', 'description', 'created', 'updated']
    inlines = [CompanyMemberInline, CompanyAdminInline, CompanyPackageGroupInline]


class CompanyPackageGroupAdmin(admin.ModelAdmin):
    list_display = ['name', 'icon', 'description', 'created', 'updated']
    inlines = [CompanyPackageGroupMemberInline, CompanyPackageGroupPackageInline]


class CompanyInviteCustomerAdmin(admin.ModelAdmin):
    list_display = ['email', 'token', 'company', 'customer', 'created', 'processed']


admin.site.register(Company, CompanyAdmin)
admin.site.register(CompanyPackageGroup, CompanyPackageGroupAdmin)
admin.site.register(CompanyInviteCustomer, CompanyInviteCustomerAdmin)
