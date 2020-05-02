#!/usr/bin/env python
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
from django import template
from django.utils.html import format_html

from .. import container

register = template.Library()


@register.simple_tag
def widget(name, options=[]):
    if name not in container.keys():
        return None

    action = container[name]
    if not callable(action):
        return None

    response = action(options)
    if response is None:
        return None

    return format_html(response)
