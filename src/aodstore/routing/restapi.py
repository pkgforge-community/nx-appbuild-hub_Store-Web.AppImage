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
from rest_framework import routers

aod_store_restapi = routers.DefaultRouter()

# spec = util.find_spec('apps.company.rest.package')
# company_package = spec.loader.load_module()
# aod_store_restapi.register(r'api/customer/company/groups', company_package.CompanyPackageGroupList)
#
# spec = util.find_spec('apps.company.rest.company')
# company = spec.loader.load_module()
# aod_store_restapi.register(r'api/customer/company', company.CompanyList)
#
# spec = util.find_spec('apps.customer.rest.group')
# customer_group = spec.loader.load_module()
# aod_store_restapi.register(r'api/customer/groups', customer_group.CustomerGroupList)
#
# spec = util.find_spec('apps.customer.rest.signin')
# customer_signin = spec.loader.load_module()
# aod_store_restapi.register(r'api/customer', customer_signin.CustomerSigninViewSet)

spec = util.find_spec('apps.package.rest.group')
package_group = spec.loader.load_module()
aod_store_restapi.register(r'api/package/groups', package_group.PackageGroupList)

spec = util.find_spec('apps.package.rest.upload')
package_upload = spec.loader.load_module()
aod_store_restapi.register(r'api/package/upload/complete', package_upload.PackageUploadCompleteView)
aod_store_restapi.register(r'api/package/upload', package_upload.PackageUploadView)

spec = util.find_spec('apps.package.rest.package')
package = spec.loader.load_module()
aod_store_restapi.register(r'api/package', package.PackageList)
