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
import nested_admin

from django.contrib import admin
from django.utils.safestring import mark_safe

from .form.package import PackageForm
from .inline.comment import PackageCommentInline
from .inline.image import PackageImageInline
from .inline.package import PackageGroupInline
from .inline.version import PackageVersionInline


class PackageAdmin(nested_admin.NestedModelAdmin):
    form = PackageForm
    list_display = ['name', 'token', 'slug', 'package', 'created']
    search_fields = ('icon', 'name', 'description')
    readonly_fields = ["preview"]

    inlines = [PackageVersionInline, PackageImageInline, PackageGroupInline, PackageCommentInline]

    def preview(self, entity):
        return mark_safe('<img src="{url}" width="{width}" height="{height}" />'.format(
            url=entity.icon.url, width=100, height=100,
        ))
