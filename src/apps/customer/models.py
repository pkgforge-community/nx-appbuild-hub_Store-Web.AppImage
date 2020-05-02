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


class CustomerToken(models.Model):
    token = models.CharField(max_length=255)
    created = models.DateTimeField(auto_now=True)
    expired = models.DateTimeField(null=True, default=None)

    customer = models.ForeignKey('customer.Customer', on_delete=models.CASCADE)


class CustomerGroup(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    created = models.DateTimeField(auto_now=True)

    owner = models.ForeignKey('customer.Customer', on_delete=models.CASCADE, related_name='owner')

    admins = models.ManyToManyField('customer.Customer', through='CustomerGroupAdmin', related_name='group_admins')
    members = models.ManyToManyField('customer.Customer', through='CustomerGroupMember', related_name='group_members')
    packages = models.ManyToManyField('package.Package', through='CustomerGroupPackage')


class CustomerGroupInvite(models.Model):
    email = models.CharField(null=False, blank=False, max_length=300)
    token = models.CharField(null=False, blank=False, max_length=32)
    text = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    accepted = models.DateTimeField(auto_now=True)

    customer = models.ForeignKey('customer.Customer', on_delete=models.CASCADE)
    group = models.ForeignKey('customer.CustomerGroup', on_delete=models.CASCADE)


class CustomerPackage(models.Model):
    package = models.ForeignKey('package.Package', null=False, blank=False, on_delete=models.CASCADE)
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)


class CustomerGroupPackage(models.Model):
    package = models.ForeignKey('package.Package', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('customer.CustomerGroup', null=False, blank=False, on_delete=models.CASCADE)


class CustomerGroupAdmin(models.Model):
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('customer.CustomerGroup', null=False, blank=False, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)


class CustomerGroupMember(models.Model):
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)
    group = models.ForeignKey('customer.CustomerGroup', null=False, blank=False, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)


class CustomerCompanyAdmin(models.Model):
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)
    company = models.ForeignKey('company.Company', null=False, blank=False, on_delete=models.CASCADE)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)


class CustomerCompanyMember(models.Model):
    customer = models.ForeignKey('customer.Customer', null=False, blank=False, on_delete=models.CASCADE)
    company = models.ForeignKey('company.Company', null=False, blank=False, on_delete=models.CASCADE)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)


class Customer(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    password = models.CharField(max_length=255, null=True)
    email = models.EmailField(blank=True)
    avatar = models.FileField(upload_to='customer/avatar/%Y/%m/%d/')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    invite_company = models.ForeignKey(
        'company.CompanyInviteCustomer', null=True,
        blank=True, on_delete=models.CASCADE,
        related_name='company_invite')

    packages = models.ManyToManyField('package.Package', through='CustomerPackage')

    admin_groups = models.ManyToManyField(
        'CustomerGroup', related_name='admin_groups',
        through='CustomerGroupAdmin')

    member_groups = models.ManyToManyField(
        'CustomerGroup', related_name='member_groups',
        through='CustomerGroupMember')

    admin_companies = models.ManyToManyField(
        'company.Company', related_name='admin_companies',
        through='CustomerCompanyAdmin')

    member_companies = models.ManyToManyField(
        'company.Company', related_name='member_companies',
        through='CustomerCompanyMember')

    member_company_groups = models.ManyToManyField(
        'company.CompanyPackageGroup', related_name='member_company_groups',
        through='company.CompanyPackageGroupMember')

    @property
    def tokens(self):
        return CustomerToken.objects. \
            filter(customer=self)

    @property
    def token(self):
        return CustomerToken.objects. \
            get(customer=self)

    def __str__(self):
        return self.email
