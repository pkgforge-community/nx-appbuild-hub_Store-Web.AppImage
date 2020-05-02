# -*- coding: utf-8 -*-
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
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
