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
    repository = forms.CharField(required=True)

    class Meta:
        model = Package
        fields = '__all__'
