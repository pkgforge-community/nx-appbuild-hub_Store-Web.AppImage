#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Copyright 2015 Alex Woroschilow (alex.woroschilow@gmail.com)
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
import inject
import sys
import optparse
import logging
import django
import corsheaders
import ckeditor
import nested_admin
import chunked_upload
import tinymce
import rest_framework
import drf_yasg
import adminplus
import jet

from gevent.pywsgi import WSGIServer

abspath = sys.argv[0] \
    if len(sys.argv) else \
    os.path.abspath(__file__)
os.chdir(os.path.dirname(abspath))

if __name__ == '__main__':

    parser = optparse.OptionParser()
    parser.add_option("--config", default='default.conf', dest="config", help="The config file")
    (options, args) = parser.parse_args()

    if not os.path.exists(options.config):
        logger = logging.getLogger('server')
        logger.error('Config file not found: {}'.format(options.config))
        sys.exit(1)

    try:
        os.environ.setdefault('config', '{}'.format(options.config))
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aodstore.settings')

        from aodstore.wsgi import get_wsgi_application

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc

    container = inject.get_injector_or_die()
    config = container.get_instance('config')

    http_server = WSGIServer((
        config.get('server.host', '0.0.0.0'),
        int(config.get('server.port', '8000'))
    ), get_wsgi_application())

    http_server.serve_forever()
