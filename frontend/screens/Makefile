# This file is a part of the ergofox project
# Copyright 2020 Alex Woroschilow (alex@fitbase.de)
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
args := $(foreach a,$($(subst -,_,$1)_args),$(if $(value $a),$a="$($a)"))
SCREENS_TO_BUILD := $(shell ls src/ | grep Screen)
SCREENS_TO_EXPORT := $(shell ls dist/ | grep "Screen.js$$")
SHELL := $(shell which bash)
PWD := $(shell pwd)

.PHONY: all

all: clean $(SCREENS_TO_BUILD) export

export: $(SCREENS_TO_EXPORT)
	cp --recursive --force $(PWD)/dist/static/ \
		$(PWD)/../../application/src/apps/public/static || true
	
server:
	npx webpack  serve --config=$(PWD)/src/$(filter-out $@,$(MAKECMDGOALS))/webpack.config.js
	
clean:
	find $(PWD)/dist/static -maxdepth 1 -name '*mediapipe*' -exec rm -rf {} + || true
	find $(PWD)/dist/static -maxdepth 1 -name '*img*' -exec rm -rf {} +       || true
	find $(PWD)/dist/static -maxdepth 1 -not -type d -delete                  || true
	find $(PWD)/dist -maxdepth 1 -not -type d -delete                         || true

$(SCREENS_TO_BUILD):
	npx webpack --mode=production --config=$(PWD)/src/$@/webpack.config.js

$(SCREENS_TO_EXPORT):
	mkdir --parents $(PWD)/../../application/src/apps/public/static/js
	cp --force $(PWD)/dist/$@  $(PWD)/../../application/src/apps/public/static/js

	mkdir --parents $(PWD)/../interface/src/static/js
	cp --force $(PWD)/dist/$@  $(PWD)/../interface/src/static/js
