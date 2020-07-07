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
import inject
from django.template.loader import render_to_string

from apps.widgets import widget


@widget(name='dashboard.search')
def search(request=None):
    return render_to_string("package/widget/search.html", {
        'poll': 'test'
    })


@widget(name='dashboard.latest')
@inject.params(package='package')
def latest(request=None, package=None):
    return render_to_string("package/widget/latest.html", {
        'collection': package.random(2)
    })


@widget(name='dashboard.featured')
@inject.params(package='package')
def featured(request=None, package=None):
    return render_to_string("package/widget/featured.html", {
        'package': package.random()
    })


@widget(name='dashboard.popular')
@inject.params(package='package')
def popular(request=None, package=None):
    return render_to_string("package/widget/popular.html", {
        'collection': package.random(2)
    })


@widget(name='dashboard.sidebar')
@inject.params(package='package')
def sidebar(request=None, package=None):
    from apps.package.model.group import PackageGroup
    return render_to_string("package/widget/sidebar.html", {
        'collection': PackageGroup.objects.
                            order_by('name').
                            all()
    })
