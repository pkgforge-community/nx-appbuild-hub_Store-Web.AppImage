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
import os
import inject
from importlib import util
from aodstore import settings

from django.apps import AppConfig


class Config(AppConfig):
    name = "apps.inject"

    def configure(self, binder):
        from django.apps import apps

        for label in apps.app_configs:
            if label == self.label:
                continue

            application = apps.app_configs[label]

            try:
                if not hasattr(application, 'configure'):
                    continue

                configure = getattr(application, 'configure')
                if not callable(configure): continue

                binder.install(configure)

            except Exception as ex:
                print(ex)
                continue

    def ready(self):
        inject.configure_once(self.configure)
