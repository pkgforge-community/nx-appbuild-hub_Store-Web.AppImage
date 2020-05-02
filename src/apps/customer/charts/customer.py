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
import napkin


@napkin.seq_diagram()
def customer(c):
    web = c.object('web')
    server = c.object('server')
    database = c.object('database')
    email = c.object('email')

    with web:
        with server.signin('<Login>'):
            database.customer_find('<Login>').ret('Customer')
            database.password_valid('<Login>').ret('True')
            c.ret('Customer')

    with web:
        with server.signup('<CustomerModel>'):
            database.customer_find('<CustomerModel>').ret('False')
            database.customer_create('<CustomerModel>').ret('Customer')
            with email.confirmation('<Customer>'):
                web.confirmation('token')

    with web:
        with server.confirmation('<token>'):
            database.customer_find('<token>').ret('Customer')
            database.customer_activate('<token>').ret('Customer')
            c.ret('<Customer>')

    with web:
        with server.invite('<CustomerGroupInvite>'):
            email.send('<CustomerGroupInvite>').ret('True')
            c.ret('True')

    with web:
        with server.invite_accept('<CustomerGroupInvite>'):
            database.invite_valid('<CustomerGroupInvite>').ret('True')
            database.add_group_member('<CustomerGroup>, <Customer>').ret('True')
            c.ret('CustomerGroup')

    with web:
        with server.packages():
            database.customer_groups('<Customer>').ret('[<CustomerGroup>,]')
            database.customer_company_groups('<Customer>').ret('[<CompanyGroup>,]')
            database.packages('[<CustomerGroup>,]').ret('[<Package>,]')
            database.packages('[<CompanyGroup>,]').ret('[<Package>,]')
            c.ret('[<Package>,]')


@napkin.seq_diagram()
def company(c):
    web = c.object('web')
    server = c.object('server')
    database = c.object('database')
    email = c.object('email')

    with web:
        with server.invite('<CompanyInvite>'):
            email.send('<CompanyInvite>').ret('True')
            c.ret('True')

    with web:
        with server.invite_accept('<CompanyInvite>'):
            database.invite_valid('<CompanyInvite>').ret('True')
            database.add_company_member('<Company>, <Customer>').ret('True')
            c.ret('Company')

    with web:
        with server.companies():
            database.companies().ret('[<Company>,]')
            c.ret('[<Company>,]')

    with web:
        with server.company_groups():
            database.company_groups().ret('[<CompanyGroup>,]')
            c.ret('[<CompanyGroup>,]')
