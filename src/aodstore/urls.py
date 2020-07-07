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
from django.urls import path
from django.views.static import serve
from django.conf.urls import url, include
from . import settings

from .routing.swagger import aod_store_openapi
from .routing.restapi import aod_store_restapi
from .routing.admin import aod_store_admin

from .security import for_authenticated
from .security import for_developers

from apps.package.views.dashboard import DashboardView
from apps.package.views.package import PackageView
from apps.package.views.package import PackageDownloadView
from apps.package.views.group import GroupView
from apps.public.views.page import PageView

urlpatterns = []
urlpatterns.append(path(r'rest/', include(aod_store_restapi.urls)))
urlpatterns.append(path(r'^jet/', include('jet.urls', 'jet')))
urlpatterns.append(path(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')))
urlpatterns.append(path(r'^tinymce/', include('tinymce.urls')))
urlpatterns.append(path('admin/', aod_store_admin.urls))
urlpatterns.append(path(r'^_nested_admin/', include('nested_admin.urls')))
urlpatterns.append(path('', DashboardView.as_view(), name='package_dashboard'))
urlpatterns.append(path(r'group/<id>', GroupView.as_view(), name='package_group'))
urlpatterns.append(path(r'appimage/download/<slug>', PackageDownloadView.as_view(), name='package_download'))
urlpatterns.append(path(r'appimage/<slug>', PackageView.as_view(), name='package'))
urlpatterns.append(path(r'page/<path>', PageView.as_view(), name='page'))

urlpatterns.append(url(r'{}(?P<path>.*)$'.format(settings.STATIC_URL.lstrip('/')), serve, {
    'document_root': settings.STATIC_ROOT
}))

urlpatterns.append(url(r'^{}(?P<path>.*)$'.format(settings.MEDIA_URL.lstrip('/')), serve, {
    'document_root': settings.MEDIA_ROOT
}))

urlpatterns.append(url('api/doc', aod_store_openapi.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'))
