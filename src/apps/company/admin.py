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
