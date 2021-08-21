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
from django.core.management import BaseCommand

import inject
from apps.config.services import ConfigFile
from apps.package.services.package import ServicePackage


class Command(BaseCommand):
    help = "Cleanup packages"

    @inject.params(config='config')
    def handle(self, *args, **options):

        service_config: ConfigFile = hexdi.resolve('config')
        if not service_config: raise Exception('Unknown service')

        service_package: ServicePackage = hexdi.resolve('package')
        if not service_package: raise Exception('Unknown service')

        limit = int(service_config.get('package.history.limit', 3))
        if limit is None or limit <= 0:
            return self.stdout.write(self.style.SUCCESS('done: cleanup deactivated (limit <= 0)'))

        for package in service_package.packages():
            for index, version in enumerate(package.versions):
                if index <= int(limit):
                    continue
                    
                self.stdout.write(self.style.SUCCESS('removing: {}, {}'.format(package, version.name)))
                version.delete()

        self.stdout.write(self.style.SUCCESS('done: {} processed'.format(service_package.count())))
