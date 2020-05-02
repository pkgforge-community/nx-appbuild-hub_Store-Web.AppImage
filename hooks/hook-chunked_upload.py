import sys
import glob
import os
from PyInstaller import log as logging
from PyInstaller.utils.hooks import (
    collect_all,
    collect_submodules,
    collect_data_files,
    get_module_file_attribute,
    get_module_attribute
)

logger = logging.getLogger(__name__)

datas, binaries, hiddenimports = collect_all('chunked_upload')
# logger.info('Django root directory %s', root_dir)
# for test in hiddenimports:
#     print(test)
