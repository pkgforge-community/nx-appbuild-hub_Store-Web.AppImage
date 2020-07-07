#!/usr/bin/python3
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
import logging
import optparse
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
from multiprocessing import Pool

abspath = sys.argv[0] \
    if len(sys.argv) else \
    os.path.abspath(__file__)
os.chdir(os.path.dirname(abspath))


def server(settings=None):
    host, port, options = settings

    os.environ.setdefault('config', '{}'.format(options.config))
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aodstore.settings')

    from gevent.pywsgi import WSGIServer
    from aodstore.wsgi import get_wsgi_application

    http_server = WSGIServer((
        str(host), int(port)
    ), get_wsgi_application())

    http_server.serve_forever()


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

        import django

        django.setup()

        container = inject.get_injector_or_die()
        config = container.get_instance('config')

        host = config.get('server.host', '0.0.0.0')
        ports = config.get('server.port', '8000')

        settings = []
        for port in ports.split(','):
            settings.append((host, port, options))

        pool = Pool(len(settings))
        pool.map(server, settings)

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
