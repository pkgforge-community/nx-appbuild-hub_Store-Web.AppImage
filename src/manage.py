#!/usr/bin/env python
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
import os
import sys
import optparse
import logging
import django
import corsheaders
import corsheaders.middleware
import ckeditor
import nested_admin
import tinymce
import rest_framework
import drf_yasg

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

        from django.core.management import execute_from_command_line

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc

    execute_from_command_line([x for x in sys.argv if x[:x.rfind("=")] not in parser.get_all_option_strings()])
