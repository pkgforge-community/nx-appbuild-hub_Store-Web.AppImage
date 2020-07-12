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
APPDIR := ./AppDir
APPDIR_APPLICATION := ${APPDIR}/application
BUILDROOT = $(shell pwd)/build
GLIBC_VERSION := $(shell getconf GNU_LIBC_VERSION | sed 's/ /-/g' )
SHELL:=$(shell which bash)

all: init server clean

init:
	rm -rf venv
	python3 -m venv --copies --system-site-packages venv && source venv/bin/activate && python3 -m pip install -r ./requirements.txt

server:
	rm -rf $(APPDIR_APPLICATION)
	mkdir -p $(APPDIR_APPLICATION)
	source venv/bin/activate && python3 ./src/manage.py collectstatic --clear --noinput
	source venv/bin/activate && python3 -m PyInstaller --additional-hooks-dir=hooks src/server.py --distpath $(APPDIR) --name application --noconfirm
	cp -r ./src/apps $(APPDIR_APPLICATION)
	cp -r ./src/aodstore $(APPDIR_APPLICATION)
	cp -r ./src/templates $(APPDIR_APPLICATION)
	cp -r ./src/static $(APPDIR_APPLICATION)
	export ARCH=x86_64 && bin/appimagetool-x86_64.AppImage  ./AppDir apprepo.AppImage
	@echo "done: apprepo.AppImage"

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
