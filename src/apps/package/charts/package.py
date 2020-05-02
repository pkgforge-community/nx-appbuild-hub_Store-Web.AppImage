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
