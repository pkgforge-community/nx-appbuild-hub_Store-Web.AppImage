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
    Columns
} from 'react-bulma-components';
import { MessageLoading } from "../Message/MessageLoading";
import { GroupCollectionElement } from "./GroupCollectionElement";


export default function GroupCollection(props) {
    const [collection, setCollection] = React.useState(undefined)

    React.useEffect(() => {
        fetch(props.sourceUrl)
            .then(res => res.json())
            .then(
                (result) => {
                    setCollection(result);
                },
                (error) => {
                    setError(error);
                }
            )
    }, [props.sourceUrl])

    if (collection == undefined) {
        return <MessageLoading />
    }

    return (
        <>
            <Columns vCentered={true} centered={true}>
                {collection.map((entity, index) => (
                    <Columns.Column size={2}>
                        <GroupCollectionElement entity={entity} />
                    </Columns.Column>
                ))}
            </Columns>
        </>
    );
};
