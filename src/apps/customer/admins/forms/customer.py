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
