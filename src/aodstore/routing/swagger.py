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
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

aod_store_openapi = get_schema_view(
    openapi.Info(
        title="AOD Store",
        default_version='v1',
        description="AOD Store",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="aodstore@fitbase.de"),
        license=openapi.License(name="BSD License"),
    ),
    public=False,
    permission_classes=(permissions.AllowAny,),
)
