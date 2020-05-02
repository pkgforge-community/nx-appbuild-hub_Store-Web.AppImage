from django.core.management import BaseCommand
import os
import dicis.settings as settings
from datetime import datetime

class Command(BaseCommand):
    help = "Load scripts"

    def add_arguments(self, parser):
        parser.add_argument(
            '--app',
            help='Application where migrations need to be executed',
        )

    def handle(self, *args, **options):
        print("Load scripts command start: {}".format(datetime.now()))
        apps = [options.get('app')] \
            if options.get('app') else settings.SCRIPT_APPS
        for app in apps:
            scripts = []
            for root, dir, files in \
                os.walk("{}/{}/data_migration/".format(settings.BASE_DIR,app)):
                for file in files:
                    if file.startswith('migrate_'):
                        scripts.append(os.path.join(root, file))

            for script in sorted(scripts):
                print("script {} is executing.".format(script))
                exec(open(script).read())
                print("script {} is finished.".format(script))
        print("Load scripts command start: {}".format(datetime.now()))
