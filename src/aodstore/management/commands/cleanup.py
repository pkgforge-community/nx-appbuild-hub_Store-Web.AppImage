import inject
from django.core.management import BaseCommand

from apps.package.model.package import Package


class Command(BaseCommand):
    help = "Cleanup packages"

    @inject.params(config='config')
    def handle(self, *args, **options):

        assert ('config' in options.keys())
        config = options['config']

        limit = int(config.get('package.history.limit', 3))
        if limit is None or limit <= 0:
            return self.stdout.write(self.style.SUCCESS('done: cleanup deactivated (limit <= 0)'))

        for package in Package.objects.all():
            for index, version in enumerate(package.versions):
                if index <= int(limit): continue
                self.stdout.write(self.style.SUCCESS('removing: {}, {}'.format(package, version.name)))
                version.delete()

        self.stdout.write(self.style.SUCCESS('done: {} processed'.format(Package.objects.count())))
