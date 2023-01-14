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
import os
import ast

from .plugins.cors import *
from .plugins.database import *
from .plugins.rest import *
from .plugins.swagger import *
from .plugins.template import *
from .plugins.tinymce import *
from .plugins.translation import *

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

APP_NAME = os.environ.get('APPLICATION_NAME')
SECRET_KEY = os.environ.get('APPLICATION_SECRET')

ROOT_URLCONF = 'aodstore.urls'
WSGI_APPLICATION = 'aodstore.wsgi.application'

USE_TZ = os.environ.get('TIMEZONE_ENABLED', 'False')
USE_TZ = ast.literal_eval(USE_TZ) if USE_TZ else False

TIME_ZONE = os.environ.get('TIMEZONE', 'Europe/Berlin')
TIME_ZONE =TIME_ZONE if len(TIME_ZONE) else 'Europe/Berlin'
assert (len(TIME_ZONE))

JET_SIDE_MENU_COMPACT = True
JET_CHANGE_FORM_SIBLING_LINKS = False

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = ast.literal_eval(os.environ.get('DEBUG', 'False'))

SERVER_URL = os.environ.get('SERVER_URL')
SERVER_HOST = os.environ.get('SERVER_HOST')
SERVER_SCHEME = os.environ.get('SERVER_SCHEME')
SERVER_PORT = os.environ.get('SERVER_PORT')
SERVER_KEY = os.environ.get('SERVER_KEY')
SERVER_CRT = os.environ.get('SERVER_CRT')

if len(SERVER_SCHEME) and SERVER_SCHEME == "https": 
    SECURE_PROXY_SSL_HEADER = ('SERVER_SCHEME', SERVER_SCHEME)

DOMAIN = "{}://{}:{}".format(SERVER_SCHEME, SERVER_HOST, SERVER_PORT) \
        if len(SERVER_PORT) else "{}://{}".format(SERVER_SCHEME, SERVER_HOST) 

USE_X_FORWARDED_HOST = True

ALLOWED_HOSTS = ['*']

INSTALLED_APPS = []
INSTALLED_APPS.append('django.contrib.auth')
INSTALLED_APPS.append('django.contrib.contenttypes')
INSTALLED_APPS.append('django.contrib.sessions')
INSTALLED_APPS.append('django.contrib.messages')
INSTALLED_APPS.append('django.contrib.staticfiles')
INSTALLED_APPS.append('django_extensions')
INSTALLED_APPS.append('fullurl')
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

STATIC_ROOT = os.environ.get('STATIC_LOCATION','/srv/static/')
STATIC_ROOT =STATIC_ROOT if len(STATIC_ROOT) else '/srv/static/'
assert (len(STATIC_ROOT))

STATIC_URL = os.environ.get('STATIC_PREFIX','/static/')
STATIC_URL =STATIC_URL if len(STATIC_URL) else '/static/'
assert (len(STATIC_URL))

MEDIA_ROOT = os.environ.get('MEDIA_LOCATION','/srv/media/')
MEDIA_ROOT =MEDIA_ROOT if len(MEDIA_ROOT) else '/srv/media/'
assert (len(MEDIA_ROOT))

MEDIA_URL = os.environ.get('MEDIA_PREFIX','/media/')
MEDIA_URL =MEDIA_URL if len(MEDIA_URL) else '/media/'
assert (len(MEDIA_URL))

FIXTURE_DIRS = [os.path.join(BASE_DIR, 'fixtures')]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST_USER = os.environ.get('EMAIL_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_PASSWORD')
EMAIL_HOST = os.environ.get('EMAIL_HOST')

EMAIL_PORT = os.environ.get('EMAIL_PORT', '587')
EMAIL_PORT =EMAIL_PORT if len(EMAIL_PORT) else 587

EMAIL_USE_TLS = os.environ.get('EMAIL_TLS', 'True')
EMAIL_USE_TLS =ast.literal_eval(EMAIL_USE_TLS) if EMAIL_USE_TLS else True
