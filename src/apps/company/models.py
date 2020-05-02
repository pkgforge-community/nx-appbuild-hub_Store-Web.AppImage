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
