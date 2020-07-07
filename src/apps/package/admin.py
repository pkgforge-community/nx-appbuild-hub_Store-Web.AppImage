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
from django.contrib import admin

from .model.package import Package
from .model.request import PackageRequest
from .model.group import PackageGroup
from .model.upload import PackageUpload

from .admins.package import PackageAdmin
from .admins.request import PackageRequestAdmin
from .admins.group import PackageGroupAdmin
from .admins.upload import PackageUploadAdmin

admin.site.register(Package, PackageAdmin)
admin.site.register(PackageRequest, PackageRequestAdmin)
admin.site.register(PackageGroup, PackageGroupAdmin)
admin.site.register(PackageUpload, PackageUploadAdmin)
