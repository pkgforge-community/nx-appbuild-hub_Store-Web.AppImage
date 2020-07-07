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
from django.db import models


class Company(models.Model):
    name = models.CharField(max_length=255, null=False, blank=False)
    slug = models.CharField(max_length=255, null=False, blank=False)
    description = models.TextField(null=True, blank=True)
    icon = models.FileField(upload_to='package/icon/%Y/%m/%d/', null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    parent = models.ForeignKey(
        "company.Company", null=True, blank=True,
        on_delete=models.SET_NULL)

    admins = models.ManyToManyField(
        'customer.Customer', related_name='company_admins',
        through='customer.CustomerCompanyAdmin')

    members = models.ManyToManyField(
        'customer.Customer', related_name='company_members',
        through='customer.CustomerCompanyMember')

    def __str__(self):
        return self.name


class CompanyPackageGroup(models.Model):
    name = models.CharField(max_length=100)
    icon = models.FileField(upload_to='package/icon/%Y/%m/%d/')
    description = models.CharField(max_length=300)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    company = models.ForeignKey(
        "company.Company", null=True, blank=True,
        on_delete=models.SET_NULL)

    packages = models.ManyToManyField('package.Package', through='company.CompanyPackageGroupPackage')
    members = models.ManyToManyField('customer.Customer', through='company.CompanyPackageGroupMember')

    def __str__(self):
        return self.name


class CompanyInviteCustomer(models.Model):
    email = models.CharField(max_length=255, null=False, blank=False)
    token = models.CharField(max_length=255, null=False, blank=False)
    text = models.TextField(null=True, blank=True, default=None)
    created = models.DateTimeField(auto_now_add=True)
    processed = models.DateTimeField(null=True, blank=True, default=None)

    company = models.ForeignKey('company.Company', null=True, blank=True, on_delete=models.CASCADE)
    customer = models.ForeignKey('customer.Customer', null=True, blank=True, on_delete=models.CASCADE)

    def __str(self):
        return self.text


class CompanyPackageGroupMember(models.Model):
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('company.CompanyPackageGroup', null=False, blank=False, on_delete=models.CASCADE)


class CompanyPackageGroupPackage(models.Model):
    package = models.ForeignKey('package.Package', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('company.CompanyPackageGroup', null=False, blank=False, on_delete=models.CASCADE)
