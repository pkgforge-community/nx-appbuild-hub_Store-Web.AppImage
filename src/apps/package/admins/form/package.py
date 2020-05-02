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
import random
import string

from django import forms
from tinymce.widgets import TinyMCE

from apps.package.model.package import Package


def string_random(x=32):
    return ''.join(random.sample(string.ascii_lowercase + string.ascii_uppercase + string.digits, x))


class PackageForm(forms.ModelForm):
    token = forms.CharField(required=True, initial=string_random)
    slug = forms.CharField(required=True, initial=string_random)
    description = forms.CharField(widget=TinyMCE(attrs={'cols': 80, 'rows': 20}))

    class Meta:
        model = Package
        fields = '__all__'
