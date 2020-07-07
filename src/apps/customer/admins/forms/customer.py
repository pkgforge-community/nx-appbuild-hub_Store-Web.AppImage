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
from django import forms
from django.contrib.auth import hashers
from django.contrib.auth import password_validation
from django.utils.translation import gettext_lazy as _

from . import models


class CustomerUpdateForm(forms.ModelForm):
    class Meta:
        model = models.Customer
        fields = ['first_name', 'last_name', 'email', 'avatar']

    def form_action(self, account, user):
        raise NotImplementedError()


class CustomerCreateForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(), required=False)

    class Meta:
        model = models.Customer
        fields = ['first_name', 'last_name', 'email', 'password', 'avatar']


class CustomerPasswordForm(forms.Form):
    error_messages = {
        'password_mismatch': _("The two password fields didn't match."),
    }
    required_css_class = 'required'
    password1 = forms.CharField(
        label=_("Password"),
        widget=forms.PasswordInput(attrs={'autofocus': True}),
        strip=False,
        help_text=password_validation.password_validators_help_text_html(),
    )
    password2 = forms.CharField(
        label=_("Password (again)"),
        widget=forms.PasswordInput,
        strip=False,
        help_text=_("Enter the same password as before, for verification."),
    )

    def __init__(self, customer, *args, **kwargs):
        self.customer = customer
        super().__init__(*args, **kwargs)

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError(
                    self.error_messages['password_mismatch'],
                    code='password_mismatch',
                )
        password_validation.validate_password(password2, self.customer)
        return password2

    def save(self, commit=True):
        """Save the new password."""
        password = self.cleaned_data["password1"]
        self.customer.password = hashers.make_password(password)
        if commit:
            self.customer.save()
        return self.customer

    @property
    def changed_data(self):
        data = super().changed_data
        for name in self.fields:
            if name not in data:
                return []
        return ['password']
