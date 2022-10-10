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
    Columns, Heading, Content
} from 'react-bulma-components';


import { BiDownload, BiHome } from 'react-icons/bi';
import { BsGithub } from 'react-icons/bs';
import Moment from 'moment';

export const PackageCollectionElement = (props) => {
    const [entity, setEntity] = useState(props.entity)

    return (
        <Block style={{ margin: "10px" }}>
            <Columns style={{
                borderRadius: "15px",
                border: "2px solid #E9E9E9",
                height: "320px",
                padding: "5px"
            }}>
                <Columns.Column size={12} style={{ background: "white" }}>
                    <a href={entity.page}>
                        <Heading size="5">
                            {entity.name}
                        </Heading>
                    </a>
                </Columns.Column>

                <Columns.Column size={12}
                    style={{ maxHeight: "210px" }}>
                    <a href={entity.page}>
                        <figure>
                            <img src={entity.preview}
                                alt={entity.name} />
                        </figure>
                    </a>
                </Columns.Column>
                <Columns.Column size={12} style={{ background: "white" }}>
                    <Columns>
                        {entity.page_home != undefined ?
                            <Columns.Column size={1}>
                                <a href={entity.page_home} target="_blank">
                                    <BiHome />
                                </a>
                            </Columns.Column> : ""}
                        {entity.page_source != undefined ?
                            <Columns.Column size={1}>
                                <a href={entity.page_source} target="_blank">
                                    <BsGithub />
                                </a>
                            </Columns.Column> : ""}
                        {entity.file != undefined ?
                            <Columns.Column size={1}>
                                <a href={entity.file} target="_blank">
                                    <BiDownload />
                                </a>
                            </Columns.Column> : ""}
                        {entity.updated_at != undefined ?
                            <Columns.Column size={7} offset={1}>
                                <Content size={"size-6"} style={{ textAlign: "left" }}>
                                    Updated: {Moment(entity.updated_at * 1000).format('DD.MM.YYYY')}
                                </Content>
                            </Columns.Column>
                            : ""}
                    </Columns>
                </Columns.Column>
            </Columns>
        </Block>
    );
};
