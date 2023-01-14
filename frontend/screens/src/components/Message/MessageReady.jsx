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
    Block, Button, Heading
} from 'react-bulma-components';

export const MessageReady = (props) => {
    return <Block style={{ margin: "15px 15px" }}>
        <Heading style={{ color: "#ffffff" }}>Bereit zum Loslegen!</Heading>
        <Heading style={{ color: "#ffffff" }} subtitle>Klicken Sie auf das Video, um in den Vollbildmodus zu wechseln, und folgen Sie den Anweisungen.</Heading>
        <Block style={{ margin: "15px 15px" }}>
            <Button.Group size="small" align="center">
                <Button color="primary"
                    onClick={props.onClickBack}
                    rounded={true}>
                    Zurück
                </Button>
            </Button.Group>
        </Block>
    </Block>
};
