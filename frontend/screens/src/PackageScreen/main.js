// Copyright 2021 Alex Woroschilow(alex@ergofox.me)
//
// Licensed under the Apache License, Version 2.0(the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"use strict";
import React from "react";
import ReactDOM from "react-dom";
import { PackageScreen } from "../components/PackageScreen";

let container = document.getElementById("PackageScreen");
if (!container.hasAttribute("data-source")) {
  throw "Please set .workout[data-source=....]";
}

const root = ReactDOM.createRoot(container);
root.render(
  <PackageScreen sourceUrl={container.getAttribute("data-source")} />
);
