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
from django import template
from django.urls import reverse

register = template.Library()


@register.simple_tag(takes_context=True)
def abs_url(context, view_name, *args, **kwargs):
    # Could add except for KeyError, if rendering the template
    # without a request available.
    return context['request'].build_absolute_uri(
        reverse(view_name, args=args, kwargs=kwargs)
    )


@register.filter
def as_abs_url(path, request):
    return request.build_absolute_uri(path)
