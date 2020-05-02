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
from importlib import util
from rest_framework import routers

aod_store_restapi = routers.DefaultRouter()

spec = util.find_spec('apps.company.rest.package')
company_package = spec.loader.load_module()
aod_store_restapi.register(r'api/customer/company/groups', company_package.CompanyPackageGroupList)

spec = util.find_spec('apps.company.rest.company')
company = spec.loader.load_module()
aod_store_restapi.register(r'api/customer/company', company.CompanyList)

spec = util.find_spec('apps.customer.rest.group')
customer_group = spec.loader.load_module()
aod_store_restapi.register(r'api/customer/groups', customer_group.CustomerGroupList)

spec = util.find_spec('apps.customer.rest.signin')
customer_signin = spec.loader.load_module()
aod_store_restapi.register(r'api/customer', customer_signin.CustomerSigninViewSet)

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
