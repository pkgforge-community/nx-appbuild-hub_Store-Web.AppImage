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

all:

	mkdir -p $(PWD)/build
	mkdir -p $(PWD)/build/AppDir
	mkdir -p $(PWD)/build/AppDir/python
	mkdir -p $(PWD)/build/AppDir/server
	mkdir -p $(PWD)/build/AppDir/vendor

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/python38-3.8.6-3.module_el8.5.0+742+dbad1979.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/python38-devel-3.8.6-3.module_el8.5.0+742+dbad1979.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/python38-pip-19.3.1-4.module_el8.6.0+929+89303463.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/python38-setuptools-41.6.0-5.module_el8.6.0+929+89303463.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/python38-libs-3.8.12-1.module_el8.6.0+929+89303463.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1k-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/libffi-3.1-22.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/intltool-0.51.0-11.el8.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/libgudev-232-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..


	cp --recursive --force $(PWD)/src/* $(PWD)/build/AppDir/server
	cp --recursive --force $(PWD)/build/usr/* $(PWD)/build/AppDir/python
	cp --recursive --force $(PWD)/AppDir/AppRun $(PWD)/build/AppDir/AppRun

	rm -rf $(PWD)/build/AppDir/server/uploads/*
	rm -rf $(PWD)/build/AppDir/server/static/*

	chmod +x $(PWD)/build/AppDir/AppRun

	rm -rf $(PWD)/build/AppDir/vendor/*
	$(PWD)/build/AppDir/AppRun --python -m pip install  -r $(PWD)/requirements.txt --target=$(PWD)/build/AppDir/vendor --upgrade
	$(PWD)/build/AppDir/AppRun --python -m pip uninstall typing -y || true
	rm -rf $(PWD)/build/AppDir/vendor/typing.py || true


	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/AppDir/
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/AppDir/ || true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/AppDir/ || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool-x86_64.AppImage  $(PWD)/build/AppDir $(PWD)/apprepo.AppImage
	chmod +x $(PWD)/apprepo.AppImage


init:
	rm -rf venv
	python3 -m venv --copies --system-site-packages venv && source venv/bin/activate && python3 -m pip install -r ./requirements.txt



clean:
	rm -rf ${APPDIR}/build
