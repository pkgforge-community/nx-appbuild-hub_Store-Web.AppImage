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
