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
import hexdi
from django.template.loader import render_to_string

from apps.package.services.package import ServicePackage
from apps.widgets import widget


@widget(name='dashboard.search')
def search(request=None):

    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/search.html", {
        'poll': 'test'
    })


@widget(name='dashboard.latest')
def latest(request=None):
    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/latest.html", {
        'collection': service_package.random(2)
    })


@widget(name='dashboard.featured')
def featured(request=None):
    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/featured.html", {
        'package': service_package.random()
    })


@widget(name='dashboard.popular')
def popular(request=None):
    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/popular.html", {
        'collection': service_package.random(2)
    })


@widget(name='dashboard.sidebar')
def dashboard_sidebar_widget(request=None):
    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/sidebar.html", {
        'collection': service_package.groups()
    })


@widget(name='dashboard.groups')
def dashboard_groups_widget(template=None):
    service_package: ServicePackage = hexdi.resolve('package')
    if not service_package: raise Exception('Unknown service')

    return render_to_string("package/widget/groups.html" if not template else template, {
        'collection': service_package.groups(),
        'total': service_package.count(),
    })
