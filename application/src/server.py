# Copyright 2022 Alex Woroschilow (info@apprepo.de)
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
import logging

import optparse
import os
import sys


from dj_static import Cling, MediaCling

abspath = os.path.abspath(sys.argv[0]) if len(sys.argv) else os.path.abspath(__file__)
os.chdir(os.path.dirname(abspath))


def wrapper(options=[]):
    if not options: return None
    if not len(options): return None

    callback, args = options
    if not callback: return None
    if not args: return None

    callback(*args)


if __name__ == '__main__':

    parser = optparse.OptionParser()
    parser.add_option("--loglevel", default=logging.ERROR, dest="loglevel", help="Logging level")

    (options, args) = parser.parse_args()

    log_format = '[%(relativeCreated)d][%(name)s] %(levelname)s - %(message)s'
    logging.basicConfig(level=options.loglevel, format=log_format, stream=sys.stdout)

    try:

        from gevent.pywsgi import WSGIServer
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aodstore.settings')
        
        from aodstore.wsgi import get_wsgi_application
        from aodstore import settings

        http_server = WSGIServer(
            ("0.0.0.0", 9000),
            Cling(MediaCling(get_wsgi_application())),
            certfile=settings.SERVER_CRT,
            keyfile=settings.SERVER_KEY,
            environ={
                'wsgi.multithread': True,
                'wsgi.multiprocess': True,
                'wsgi.run_once': False
            })

        http_server.serve_forever()


    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
