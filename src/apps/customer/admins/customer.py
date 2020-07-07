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
from importlib import util
from django.contrib import admin
from django.contrib import messages
from django.contrib.admin.options import IS_POPUP_VAR
from django.contrib.admin.utils import unquote
from django.http import HttpResponseRedirect
from django.utils.decorators import method_decorator
from django.utils.translation import gettext, gettext_lazy as _
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.debug import sensitive_post_parameters

from django.utils.html import format_html
from django.urls import path
from django.urls import reverse
from django.template.response import TemplateResponse

csrf_protect_m = method_decorator(csrf_protect)
sensitive_post_parameters_m = method_decorator(sensitive_post_parameters())

from .forms.customer import CustomerCreateForm
from .forms.customer import CustomerUpdateForm
from .forms.customer import CustomerPasswordForm

spec = util.find_spec('apps.customer.inline.admin')
inline = spec.loader.load_module()


class CustomerAdmin(admin.ModelAdmin):
    list_display = ['email', 'first_name', 'last_name', 'customer_actions']
    inlines = [inline.CustomerTokenInline, inline.CustomerGroupInline, inline.CustomerGroupInviteInline,
               inline.CustomerPackageInline, inline.CustomerAdminGroupInline, inline.CustomerMemberGroupInline,
               inline.CustomerAdminCompanyInline, inline.CustomerMemberCompanyInline,
               inline.CustomerMemberCompanyGroupInline]

    def get_form(self, request, customer=None, **kwargs):
        kwargs['form'] = CustomerCreateForm
        if customer is not None and customer.pk is not None:
            kwargs['form'] = CustomerUpdateForm
        return super().get_form(request, customer, **kwargs)

    def get_urls(self):
        return [
                   path(
                       '<id>/password/',
                       self.admin_site.admin_view(self.process_password),
                       name='customer_password_change',
                   ),
               ] + super().get_urls()

    def customer_actions(self, obj):
        return format_html(
            '<a class="button" href="{}">Update passwrd</a>',
            reverse('admin:customer_password_change', args=[obj.pk]),
        )

    customer_actions.short_description = 'Actions'
    customer_actions.allow_tags = True

    @sensitive_post_parameters_m
    def process_password(self, request, id, form_url=''):
        customer = self.get_object(request, unquote(id))

        form = CustomerPasswordForm(customer, request.POST) \
            if request.method == 'POST' \
            else CustomerPasswordForm(customer)

        if request.method == 'POST' and form.is_valid():
            messages.success(request, gettext('Password changed successfully.'))
            form.save()

            return HttpResponseRedirect(
                reverse('{}:{}_{}_change'.format(
                    self.admin_site.name,
                    customer._meta.app_label,
                    customer._meta.model_name,
                ), args=(customer.pk,), ))

        fieldsets = [(None, {'fields': list(form.base_fields)})]
        admin_form = admin.helpers.AdminForm(form, fieldsets, {})
        request.current_app = self.admin_site.name

        return TemplateResponse(request, 'admin/auth/user/change_password.html', {
            'title': _('Change password: {}').format(customer.email if customer is not None else None),
            'adminForm': admin_form,
            'form_url': form_url,
            'form': form,
            'is_popup': (IS_POPUP_VAR in request.POST or
                         IS_POPUP_VAR in request.GET),
            'add': True,
            'change': False,
            'has_delete_permission': False,
            'has_change_permission': True,
            'has_absolute_url': False,
            'opts': self.model._meta,
            'original': customer,
            'save_as': False,
            'show_save': True,
            **self.admin_site.each_context(request),
        }, )
