# Copyright 2020 Alex Woroschilow (info@apprepo.de)
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
import warnings

warnings.filterwarnings("ignore")

abspath = os.path.abspath(sys.argv[0]) if len(sys.argv) else os.path.abspath(__file__)
os.chdir(os.path.dirname(abspath))

class OptionParserFitbase(optparse.OptionParser):
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

    parser = OptionParserFitbase()
    parser.add_option("--loglevel", default=logging.DEBUG, dest="loglevel", help="Logging level")

    (options, args) = parser.parse_args()

    log_format = '[%(relativeCreated)d][%(name)s] %(levelname)s - %(message)s'
    logging.basicConfig(level=options.loglevel, format=log_format, stream=sys.stdout)

    try:
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aodstore.settings')
        from django.core.management import execute_from_command_line

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc

    execute_from_command_line([x for x in sys.argv if x[:x.rfind("=")] not in parser.get_all_option_strings()])
