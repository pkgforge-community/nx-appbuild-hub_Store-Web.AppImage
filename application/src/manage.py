#!/usr/bin/python3
# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo (https://apprepo.de) project
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
import logging
import optparse
import os
import sys

abspath = sys.argv[0] \
    if len(sys.argv) else \
    os.path.abspath(__file__)
os.chdir(os.path.dirname(abspath))


class OptionParserAOD(optparse.OptionParser):
    def error(self, msg):
        pass

    def get_all_option_strings(self):
        response = []
        for element in self.option_list[:]:
            response.extend("{}".format(element).split('/'))
        for group in self.option_groups:
            for element in group.option_list:
                response.extend("{}".format(element).split('/'))
        return response


if __name__ == '__main__':

    parser = OptionParserAOD()
    parser.add_option("--config", default='default.conf', dest="config", help="The config file")
    (options, args) = parser.parse_args()

    if not os.path.exists(options.config):
        logger = logging.getLogger('console')
        logger.error('Config file not found: {}'.format(options.config))
        sys.exit(1)

    try:

        os.environ.setdefault('config', '{}'.format(options.config))
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aodstore.settings')

        from aodstore import settings

        from django.core.management import execute_from_command_line

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc

    execute_from_command_line([x for x in sys.argv if x[:x.rfind("=")] not in parser.get_all_option_strings()])
