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

import * as React from "react";
import {
    Block,
    Heading
} from 'react-bulma-components';
import Loader from "react-loader-spinner";

export const MessagePending = (props) => {
    return <Block style={{ margin: "15px 15px" }} >
        <Heading style={{ color: "#ffffff" }}>Das Workout wird geladen...</Heading>
        <Heading style={{ color: "#ffffff" }} subtitle>Bitte warten Sie, bis das Workout geladen ist</Heading>

        <Block style={{ margin: "15px 15px" }} class="is-text-centered">
            <Loader
                type="BallTriangle"
                color="#ffffff"
                height={100}
                width={100}
            />
        </Block>
    </Block>
};
