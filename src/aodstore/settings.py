# -*- coding: utf-8 -*-
# This software is a part of the A.O.D apprepo (https://apprepo.de) project
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
from apps.config.services import ConfigFile
from .plugins.cors import *
from .plugins.database import *
from .plugins.rest import *
from .plugins.swagger import *
from .plugins.template import *
from .plugins.tinymce import *
from .plugins.translation import *

assert (REST_FRAMEWORK is not None)
assert (TINYMCE_DEFAULT_CONFIG is not None)
assert (SWAGGER_SETTINGS is not None)
assert (TEMPLATE_CONTEXT_PROCESSORS is not None)
assert (CORS_ALLOW_HEADERS is not None)
assert (DATABASES is not None)
assert (LANGUAGE_CODE is not None)
assert (USE_I18N is not None)
assert (USE_L10N is not None)
assert (DATABASES is not None)
assert (DATABASES is not None)
assert (DATABASES is not None)

config = ConfigFile(os.environ.get('config'))
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

APP_NAME = config.get('default.app_name', 'apprepo')
SECRET_KEY = config.get('default.secret', '$v81(vxr-ybm$*rz4la__(h2j$56wj8-9mp^*7m91q04ynh((e')
assert (SECRET_KEY is not None)
assert (APP_NAME is not None)

ROOT_URLCONF = 'aodstore.urls'
WSGI_APPLICATION = 'aodstore.wsgi.application'

TIME_ZONE = str(config.get('default.timezone', 'UTC') or 'UTC')
USE_TZ = True

JET_SIDE_MENU_COMPACT = True
JET_CHANGE_FORM_SIBLING_LINKS = False

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = int(config.get('default.debug', 1) or 1)
CORS_ORIGIN_ALLOW_ALL = bool(config.get('default.cors', 1) or 1)

ALLOWED_HOSTS = ['*']

INSTALLED_APPS = []
INSTALLED_APPS.append('django.contrib.auth')
INSTALLED_APPS.append('django.contrib.contenttypes')
INSTALLED_APPS.append('django.contrib.sessions')
INSTALLED_APPS.append('django.contrib.messages')
INSTALLED_APPS.append('django.contrib.staticfiles')
INSTALLED_APPS.append('corsheaders')
INSTALLED_APPS.append('ckeditor')
INSTALLED_APPS.append('nested_admin')
INSTALLED_APPS.append('jet.dashboard')
INSTALLED_APPS.append('jet')
INSTALLED_APPS.append('tinymce')
INSTALLED_APPS.append('adminplus')
INSTALLED_APPS.append('rest_framework')
INSTALLED_APPS.append('chunked_upload')
INSTALLED_APPS.append('drf_yasg')
INSTALLED_APPS.append('django.contrib.admin.apps.SimpleAdminConfig')
INSTALLED_APPS.append('aodstore')
INSTALLED_APPS.append('apps.inject.Config')
INSTALLED_APPS.append('apps.config.Config')
INSTALLED_APPS.append('apps.package.Config')
INSTALLED_APPS.append('apps.widgets.Config')
INSTALLED_APPS.append('apps.public.Config')
INSTALLED_APPS.append('apps.customer.Config')
INSTALLED_APPS.append('apps.company.Config')
INSTALLED_APPS.append('apps.template.Config')

MIDDLEWARE = []
MIDDLEWARE.append('django.middleware.security.SecurityMiddleware'),
MIDDLEWARE.append('django.contrib.sessions.middleware.SessionMiddleware'),
MIDDLEWARE.append('corsheaders.middleware.CorsMiddleware'),
MIDDLEWARE.append('django.middleware.common.CommonMiddleware'),
MIDDLEWARE.append('django.middleware.csrf.CsrfViewMiddleware'),
MIDDLEWARE.append('django.contrib.auth.middleware.AuthenticationMiddleware'),
MIDDLEWARE.append('django.contrib.messages.middleware.MessageMiddleware'),
MIDDLEWARE.append('django.middleware.clickjacking.XFrameOptionsMiddleware'),

AUTH_PASSWORD_VALIDATORS = []
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'})

STATIC_ROOT = str(config.get('static.location', './static/') or './static/')
STATIC_URL = str(config.get('static.prefix', '/static/') or '/static/')
assert (STATIC_URL is not None)

MEDIA_ROOT = str(config.get('media.location', './medias/') or './medias/')
MEDIA_URL = str(config.get('media.prefix', '/media/') or '/media/')
assert (MEDIA_ROOT is not None)

FIXTURE_DIRS = [os.path.join(BASE_DIR, 'fixtures')]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST_USER = config.get('email.user', 'noreply@apprepo.de')
EMAIL_HOST_PASSWORD = config.get('email.password', 'password')
EMAIL_HOST = config.get('email.host', 'mailout.aod.name')
EMAIL_PORT = int(config.get('email.port', 587) or 587)
EMAIL_USE_TLS = bool(config.get('email.tls', 1) or 1)
DEFAULT_FROM_EMAIL = config.get('default.email_from', 'noreply@apprepo.de')
assert (DEFAULT_FROM_EMAIL is not None)
