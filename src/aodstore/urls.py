"""aodstore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
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
urlpatterns.append(path(r'package/download/<slug>', PackageDownloadView.as_view(), name='package_download'))
urlpatterns.append(path(r'package/<id>', PackageView.as_view(), name='package'))
urlpatterns.append(path(r'page/<path>', PageView.as_view(), name='page'))

urlpatterns.append(url(r'{}(?P<path>.*)$'.format(settings.STATIC_URL.lstrip('/')), serve, {
    'document_root': settings.STATIC_ROOT
}))

urlpatterns.append(url(r'^{}(?P<path>.*)$'.format(settings.MEDIA_URL.lstrip('/')), serve, {
    'document_root': settings.MEDIA_ROOT
}))

urlpatterns.append(url('api/doc', aod_store_openapi.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'))
