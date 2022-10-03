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
import React from 'react';
import ReactDOM from 'react-dom';
import PackageCollectionSearchScreen from "../components/PackageCollectionSearchScreen";

let container = document.getElementById("PackageCollectionSearchScreen");

if (!container.hasAttribute('data-source')) {
     throw "Please set [data-source=....]";
}

if (!container.hasAttribute('data-source-preview')) {
     throw "Please set [data-source-preview=....]";
}

if (!container.hasAttribute('data-source-workout')) {
     throw "Please set [data-source-workout=....]";
}

const root = ReactDOM.createRoot(container);
root.render(
  <PackageCollectionSearchScreen
    sourceUrl={container.getAttribute("data-source")}
    sourceUrlPreview={container.getAttribute("data-source-preview")}
    sourceUrlWorkout={container.getAttribute("data-source-workout")}
    sourceUrlFavorite={container.getAttribute("data-source-favorite")}
  />
);

