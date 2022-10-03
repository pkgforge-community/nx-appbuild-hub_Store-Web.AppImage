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
import React, { useState } from 'react';
import {
    Block,
    Columns, Heading
} from 'react-bulma-components';


export const PackageCollectionElement = (props) => {
    const [entity, setEntity] = useState(props.entity)

    return (
        <Block style={{ margin: "10px" }}>
            <Columns style={{
                borderRadius: "15px",
                border: "2px solid #E9E9E9",
                height: "280px",
                padding: "5px"
            }}>
                <Columns.Column size={12}
                    style={{ maxHeight: "210px" }}>
                    <figure onClick={() => { console.info(entity) }}>
                        <img src={entity.preview}
                            alt={entity.name} />
                    </figure>
                </Columns.Column>
                <Columns.Column size={12} style={{ background: "white" }}>
                    <Heading subtitle onClick={() => { console.info(entity) }}>
                        {entity.name}
                    </Heading>
                </Columns.Column>
            </Columns>
        </Block>
    );
};
