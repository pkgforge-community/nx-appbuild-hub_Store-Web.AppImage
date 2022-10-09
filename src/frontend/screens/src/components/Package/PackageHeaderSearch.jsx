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
    Columns, Form, Content, Image
} from 'react-bulma-components';
import { MessageLoading } from "../Message/MessageLoading";
import { PackageCollectionElement } from "./PackageCollectionElement";


export default function PackageHeaderSearch(props) {
    const [, updateState] = React.useState();
    const forceUpdate = React.useCallback(() => updateState({}), []);

    const [collection, setCollection] = React.useState([])

    function doSearch(event) {
        if (event.code != "Enter") {
            return;
        }

        let searchString = event.target.value;
        if (!searchString.length) {
            setCollection([]);
            return;
        }

        let searchUrl = props.sourceUrl + "?search=" + searchString;
        setCollection(undefined);

        require('axios')
            .get(searchUrl, { headers: {} })
            .then(function (response) {
                let result = response.data;
                if (result == undefined) {
                    return undefined;
                }
                setCollection(result);
                forceUpdate();
            })
            .catch(function (error) {
                console.error(error);
                setCollection([]);
            });
    }

    return (
        <>
            <Columns vCentered={true}>
                <Columns.Column size={2} paddingless={true}>
                    <Image src="static/img/logo.png"
                        fallback="/static/img/logo.png" />
                </Columns.Column>
                <Columns.Column size={8} paddingless={true}>
                    <Form.Control>
                        <Form.Input color={"info"}
                            style={{
                                fontSize: "14px",
                                height: "36px",
                            }}
                            placeholder={"Enter the search string..."}
                            className="edit-form__input"
                            onKeyDown={(e) => { doSearch(e); }}
                            size={6}
                        />
                    </Form.Control>
                </Columns.Column>
                <Columns.Column size={7} offset={2} paddingless={true}>
                    <Content size={"size-7"} pull={"left"}>
                        This is a non-profit volunteer project. Although every effort is made to ensure that everything in the repository is safe to install, you use it AT YOUR OWN RISK
                    </Content>
                </Columns.Column>
            </Columns>

            {collection != undefined
                ? <Columns vCentered={true} centered={true}>
                    {collection.map((entity, index) => (
                        <Columns.Column size={4}>
                            <PackageCollectionElement entity={entity} />
                        </Columns.Column>
                    ))}
                </Columns>
                : <>
                    <MessageLoading />
                </>
            }
        </>
    );
};
