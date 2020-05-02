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
from apps.widgets import widget
from django.template.loader import render_to_string


@widget(name='menu.main')
def menu_main(request=None):
    return render_to_string("page/widget/menu.main.html", {
        'poll': 'test'
    })


@widget(name='menu.footer')
def menu_footer(request=None):
    return render_to_string("page/widget/menu.footer.html", {
        'poll': 'test'
    })
