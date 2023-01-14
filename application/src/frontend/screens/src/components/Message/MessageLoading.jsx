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
    Block, Columns, Heading
} from 'react-bulma-components';
import Loader from "react-loader-spinner";

export const MessageLoading = (props) => {
    return <Block style={{ margin: "15px 15px" }} >
        <Columns vCentered={true} centered={true}>
            <Columns.Column size={12} className="has-text-centered">
                <Heading size={4}>Wird geladen...</Heading>
                <Heading subtitle>Bitte warten Sie, bis die Daten geladen ist</Heading>
            </Columns.Column>
        </Columns>
        <Columns vCentered={true} centered={true}>
            <Columns.Column size={12} className="has-text-centered">
                <Loader
                    type="BallTriangle"
                    color="#004969"
                    height={100}
                    width={100}
                    pull='centered'
                />
            </Columns.Column>
        </Columns>
    </Block>
};
