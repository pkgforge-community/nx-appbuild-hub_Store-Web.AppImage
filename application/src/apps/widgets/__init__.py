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
import hexdi
from django.apps import AppConfig

container = {}


@hexdi.permanent('widget')
class ServiceCustomerInstance(object):
    pass


class Config(AppConfig):
    name = "apps.widgets"

    def configure(self, binder):
        pass

    def ready(self):
        pass


def widget(name):
    def decorator(func):
        if name in container.keys():
            raise Exception('Widget already exists')

        container[name] = func

        def wrapper(*args, **kwargs):
            func(*args, **kwargs)

        return wrapper

    return decorator
