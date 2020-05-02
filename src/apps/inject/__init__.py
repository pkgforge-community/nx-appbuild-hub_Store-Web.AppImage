import os
import inject
from importlib import util
from aodstore import settings

from django.apps import AppConfig


class Config(AppConfig):
    name = "apps.inject"

    def configure(self, binder):
        from django.apps import apps

        for label in apps.app_configs:
            if label == self.label:
                continue

            application = apps.app_configs[label]

            try:
                if not hasattr(application, 'configure'):
                    continue

                configure = getattr(application, 'configure')
                if not callable(configure): continue

                binder.install(configure)

            except Exception as ex:
                print(ex)
                continue

    def ready(self):
        inject.configure_once(self.configure)
