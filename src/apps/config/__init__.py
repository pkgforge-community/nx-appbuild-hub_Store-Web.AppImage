import os
from django.apps import AppConfig

from .services import ConfigFile


class Config(AppConfig):
    name = "apps.config"

    def configure(self, binder):
        binder.bind('config', ConfigFile(os.environ.get('config')))
