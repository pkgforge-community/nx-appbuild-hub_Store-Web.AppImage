APPDIR := ./AppDir
APPDIR_APPLICATION := ${APPDIR}/application
BUILDROOT = $(shell pwd)/build
GLIBC_VERSION := $(shell getconf GNU_LIBC_VERSION | sed 's/ /-/g' )

all: init server clean

init:
	rm -rf init
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

clean:
	rm -rf ${APPDIR}/venv
	rm -rf ${APPDIR}/opt
