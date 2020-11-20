# This software is a part of the A.O.D (https://apprepo.de) project
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
APPDIR := ./AppDir
APPDIR_APPLICATION := ${APPDIR}/application
BUILDROOT = $(shell pwd)/build
GLIBC_VERSION := $(shell getconf GNU_LIBC_VERSION | sed 's/ /-/g' )
SHELL:=$(shell which bash)
PWD:=$(shell pwd)

all: init server clean

init:
	rm -rf venv
	python3 -m venv --copies --system-site-packages venv && source venv/bin/activate && python3 -m pip install -r ./requirements.txt

server:

	rm -rf $(PWD)/build
	mkdir -p $(PWD)/build
	mkdir -p $(PWD)/build/AppDir
	mkdir -p $(PWD)/build/AppDir/python
	mkdir -p $(PWD)/build/AppDir/server
	mkdir -p $(PWD)/build/AppDir/vendor


	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-devel-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/aarch64/os/Packages/python38-pip-19.2.3-5.module_el8.2.0+317+61fa6e7d.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-setuptools-41.6.0-4.module_el8.2.0+317+61fa6e7d.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-libs-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1c-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libffi-3.1-21.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/intltool-0.51.0-11.el8.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libgudev-232-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..


	cp --recursive --force $(PWD)/src/* $(PWD)/build/AppDir/server
	cp --recursive --force $(PWD)/build/usr/* $(PWD)/build/AppDir/python
	cp --recursive --force $(PWD)/AppDir/AppRun $(PWD)/build/AppDir/AppRun
	chmod +x $(PWD)/build/AppDir/AppRun

	$(PWD)/build/AppDir/AppRun --python -m pip install  -r $(PWD)/requirements.txt --target=$(PWD)/build/AppDir/vendor --upgrade
	$(PWD)/build/AppDir/AppRun --python -m pip uninstall typing -y

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/AppDir/
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/AppDir/ || true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/AppDir/ || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool-x86_64.AppImage  $(PWD)/build/AppDir $(PWD)/apprepo.AppImage
	chmod +x $(PWD)/apprepo.AppImage



	# rm -rf $(APPDIR_APPLICATION)
	# mkdir -p $(APPDIR_APPLICATION)
	# source venv/bin/activate && python3 ./src/manage.py collectstatic --clear --noinput
	# source venv/bin/activate && python3 -m PyInstaller --additional-hooks-dir=hooks src/server.py --distpath $(APPDIR) --name application --noconfirm
	# cp -r ./src/apps $(APPDIR_APPLICATION)/
	# cp -r ./src/aodstore $(APPDIR_APPLICATION)/
	# cp -r ./src/templates $(APPDIR_APPLICATION)/
	# cp -r ./src/static $(APPDIR_APPLICATION)/
	# export ARCH=x86_64 && bin/appimagetool-x86_64.AppImage  ./AppDir apprepo.AppImage
	# @echo "done: apprepo.AppImage"

console:
	rm -rf $(APPDIR_APPLICATION)
	mkdir -p $(APPDIR_APPLICATION)
	source venv/bin/activate && python3 -m PyInstaller --additional-hooks-dir=hooks src/manage.py --distpath $(APPDIR) --name application --noconfirm
	cp -r ./src/apps $(APPDIR_APPLICATION)
	cp -r ./src/aodstore $(APPDIR_APPLICATION)
	export ARCH=x86_64 && bin/appimagetool-x86_64.AppImage  ./AppDir apprepo-console.AppImage
	@echo "done: apprepo.AppImage"



clean:
	rm -rf ${APPDIR}/venv
	rm -rf ${APPDIR}/opt
