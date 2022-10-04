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
import {
    Columns, Heading, Content
} from 'react-bulma-components';
import { MessageLoading } from "../Message/MessageLoading";
import { PackageCollectionElement } from "../Package/PackageCollectionElement";


export default function Group(props) {
    const [entity, setEntity] = React.useState(undefined)

    React.useEffect(() => {
        fetch(props.sourceUrl)
            .then(res => res.json())
            .then(
                (result) => {
                    setEntity(result);
                },
                (error) => {
                    console.error(error);
                }
            )
    }, [props.sourceUrl])

    return (
        <>
            {entity != undefined
                ? <Columns vCentered={true} centered={true}>
                    <Columns.Column size={12} centered={true}>
                        <Heading>{entity.name}</Heading>
                    </Columns.Column>
                    <Columns.Column size={12} centered={true}>
                        <Content className="has-text-weight-light"
                            style={{ textAlign: "center" }}
                            dangerouslySetInnerHTML={{
                                __html: entity.description
                            }} size={"medium"} />
                        <br />
                    </Columns.Column>
                    <Columns.Column size={12} centered={true}>
                        <Columns vCentered={true} centered={true}>
                            {entity.packages.map((entity, index) => (
                                <Columns.Column size={4}>
                                    <PackageCollectionElement entity={entity} />
                                </Columns.Column>
                            ))}
                        </Columns>
                    </Columns.Column>
                </Columns>
                : <MessageLoading />}
        </>
    );
};
