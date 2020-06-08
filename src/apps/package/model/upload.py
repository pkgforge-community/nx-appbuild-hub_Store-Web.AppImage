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
import os

from chunked_upload.models import ChunkedUpload
from django.db import models
from django.dispatch import receiver

from apps.customer.models import Customer


class PackageUpload(ChunkedUpload):
    customer = models.ForeignKey(
        Customer,
        on_delete=models.CASCADE,
        related_name='customer_uploads',
        null=True,
        blank=True
    )


@receiver(models.signals.post_delete, sender=ChunkedUpload)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """
    if instance.file:
        if os.path.isfile(instance.file.path):
            os.remove(instance.file.path)
