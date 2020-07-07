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
import os

from apps.config.services import ConfigFile

config = config = ConfigFile(os.environ.get('config'))
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/
# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '$v81(vxr-ybm$*rz4la__(h2j$56wj8-9mp^*7m91q04ynh((e'

ROOT_URLCONF = 'aodstore.urls'
WSGI_APPLICATION = 'aodstore.wsgi.application'

TEMPLATE_CONTEXT_PROCESSORS = []

# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = str(config.get('default.timezone', 'UTC') or 'UTC')
assert (len(TIME_ZONE) and len(TIME_ZONE))
USE_I18N = True
USE_L10N = True
USE_TZ = True

JET_SIDE_MENU_COMPACT = True
JET_CHANGE_FORM_SIBLING_LINKS = False

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = int(config.get('default.debug', 1) or 1)

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

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': ('apps.customer.middleware.authentication.CustomerTokenAuthentication',),
    "DEFAULT_PERMISSION_CLASSES": ("apps.customer.middleware.permissions.IsAuthenticated"),
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10
}

MIDDLEWARE = []
MIDDLEWARE.append('django.middleware.security.SecurityMiddleware'),
MIDDLEWARE.append('django.contrib.sessions.middleware.SessionMiddleware'),
MIDDLEWARE.append('corsheaders.middleware.CorsMiddleware'),
MIDDLEWARE.append('django.middleware.common.CommonMiddleware'),
MIDDLEWARE.append('django.middleware.csrf.CsrfViewMiddleware'),
MIDDLEWARE.append('django.contrib.auth.middleware.AuthenticationMiddleware'),
MIDDLEWARE.append('django.contrib.messages.middleware.MessageMiddleware'),
MIDDLEWARE.append('django.middleware.clickjacking.XFrameOptionsMiddleware'),

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'OPTIONS': {'read_default_file': os.environ.get('config', 'default.conf'), },
        'TEST': {
            'NAME': 'AodStoreDjango-test',
        },
    },
}

# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = []
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'})
AUTH_PASSWORD_VALIDATORS.append({'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'})

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/
STATIC_ROOT = str(config.get('static.location', './static/') or './static/')
STATIC_URL = str(config.get('static.prefix', '/static/') or '/static/')
assert (len(STATIC_ROOT) and len(STATIC_URL))

MEDIA_ROOT = str(config.get('media.location', './medias/') or './medias/')
MEDIA_URL = str(config.get('media.prefix', '/media/') or '/media/')
assert (len(MEDIA_ROOT) and len(MEDIA_URL))

FIXTURE_DIRS = [os.path.join(BASE_DIR, 'fixtures')]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST_USER = config.get('email.user', 'store@aod.name')
EMAIL_HOST_PASSWORD = config.get('email.password', 'password')
EMAIL_HOST = config.get('email.host', 'mailout.aod.name')
EMAIL_PORT = int(config.get('email.port', 587) or 587)
EMAIL_USE_TLS = bool(config.get('email.tls', 1) or 1)

APP_NAME = config.get('default.app_name', 'AOD-Store')
DEFAULT_FROM_EMAIL = config.get('default.email_from', 'noreply@aod.name')

# Cors origin whitelist
CORS_ORIGIN_ALLOW_ALL = bool(config.get('default.cors', 1) or 1)

CORS_ALLOW_HEADERS = []
CORS_ALLOW_HEADERS.append('x-requested-with')
CORS_ALLOW_HEADERS.append('content-type')
CORS_ALLOW_HEADERS.append('content-range')
CORS_ALLOW_HEADERS.append('accept')
CORS_ALLOW_HEADERS.append('origin')
CORS_ALLOW_HEADERS.append('authorization')
CORS_ALLOW_HEADERS.append('x-csrftoken')
CORS_ALLOW_HEADERS.append('access-control-allow-origin')

SWAGGER_SETTINGS = {
    'SECURITY_DEFINITIONS': {
        'token': {
            'type': 'apiKey',
            'in': 'header',
            'name': 'Authorization'
        }
    },
}

CKEDITOR_CONFIGS = {
    'default': {
        'contentsCss': 'https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css',
    }
}
