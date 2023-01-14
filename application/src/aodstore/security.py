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
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required


def for_authenticated(function):
    @login_required
    def wrapper(request, path, document_root=None, show_indexes=False, *args, **kw):
        return function(request, path, document_root, show_indexes, *args, **kw)

    return wrapper


def for_developers(function):
    @login_required
    def wrapper(request, *args, **kw):

        if request.user.is_superuser:
            return function(request, *args, **kw)

        # fixme: replace this code. This is not a good approach to use the group name like that
        if 'Developer' not in [group.name for group in request.user.groups.all()]:
            return HttpResponseRedirect('/accounts/login/')

        return function(request, *args, **kw)

    return wrapper


def for_super_admins(function):
    @login_required
    def wrapper(request, *args, **kw):
        if request.user.is_superuser:
            return function(request, *args, **kw)

        return function(request, *args, **kw)

    return wrapper
