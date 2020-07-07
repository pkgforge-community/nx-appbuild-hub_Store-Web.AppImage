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
def package(c):
    console = c.object('console')
    server = c.object('server')
    database = c.object('database')
    clamav = c.object('clamav')
    with console:
        with server.packages('<string>'):
            database.packages('<string>').ret('[<Package>, ]')
            c.ret('[<Package>, ]')

    with console:
        with server.groups('<string>'):
            database.groups('<string>').ret('[<PackageGroup>, ]')
            c.ret('[<PackageGroup>, ]')

    with console:
        with server.upload_version('<PackageVersionModel>'):
            clamav.scan('<PackageVersionModel>').ret('True')
            database.get_package('<PackageVersionModel>').ret('Package')
            database.create_version('<PackageVersionModel>').ret('PackageVersion')
            c.ret('PackageVersion')
