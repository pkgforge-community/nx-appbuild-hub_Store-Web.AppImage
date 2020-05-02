from django.core.management import BaseCommand
import os
import dicis.settings as settings
from datetime import datetime


class Command(BaseCommand):
    help = "Run reminders"

    def add_arguments(self, parser):
        parser.add_argument(
            '--app',
            help='Application where reminders need to be executed',
        )

        parser.add_argument(
            '--reminder_name',
            help='Specific reminder to be executed',
        )

    def handle(self, *args, **options):
        apps = [options.get('app')] if options.get('app') else settings.SCRIPT_APPS
        apps = [app.replace('.', '/') for app in apps]
        reminder_name = options.get('reminder_name', None)
        print("Run reminders command start: {}".format(datetime.now()))

        for app in apps:
            scripts = []
            for root, dir, files in \
                os.walk("{}/{}/reminders/".format(settings.BASE_DIR, app)):
                for file in files:
                    if file == reminder_name or not reminder_name:
                        scripts.append(os.path.join(root, file))

            for script in sorted(scripts):
                print("script {} is executing.".format(script))
                exec(open(script).read())
                print("script {} is finished.".format(script))
        print("Run reminders command end: {}".format(datetime.now()))
