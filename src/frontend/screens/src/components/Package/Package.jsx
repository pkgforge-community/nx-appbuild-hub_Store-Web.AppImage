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
    Columns, Heading, Image, Content, Block, Tag, Button, Box, Icon
} from 'react-bulma-components';
import { MessageLoading } from "../Message/MessageLoading";
import Moment from 'moment';


export default function Package(props) {
    const [entity, setEntity] = React.useState(undefined)
    const [preview, setPreview] = React.useState(undefined)

    React.useEffect(() => {
        fetch(props.sourceUrl)
            .then(res => res.json())
            .then(
                (result) => {
                    setEntity(result);

                    if (result.images.length) {
                        setPreview(result.images[0]);
                    }

                },
                (error) => {
                    console.info(error);
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

                        <Columns vCentered={false} centered={true}>
                            <Columns.Column size={8}>

                                <Columns vCentered={true} centered={true}>
                                    <Columns.Column size={12}>
                                        <Image src={preview.url}
                                            alt={entity.name} />
                                    </Columns.Column>
                                    {entity.images.length > 1
                                        ? <Columns.Column size={12}>
                                            <Columns vCentered={true} centered={true}>
                                                {entity.images.map((image, index) => (
                                                    <Columns.Column size={3}>
                                                        <Image onClick={(e) => { setPreview(image); }}
                                                            alt={entity.name}
                                                            src={image.url}
                                                        />
                                                    </Columns.Column>
                                                ))}
                                            </Columns>
                                        </Columns.Column>
                                        : ""}
                                </Columns>


                            </Columns.Column>
                            <Columns.Column size={4}>
                                <Box style={{ margin: "0px", width: "100%" }}>
                                    <Block alignContent='center'>
                                        <Heading subtitle size={5}>Learn more:</Heading>
                                        <Button.Group size={"small"} align="center">
                                            <a href={entity.page_home} target="_blank">
                                                <Button size={"small"} color="danger">
                                                    Home page
                                                </Button>
                                            </a>
                                            <a href={entity.page_source} target="_blank">
                                                <Button size={"small"} color="dark">
                                                    Source code
                                                </Button>
                                            </a>
                                        </Button.Group>
                                        <Content className="has-text-weight-light"
                                            size={"small"} style={{ textAlign: "center" }}>
                                            Feel free to submit a pull-request if you have something to say / add / improve
                                        </Content>
                                    </Block>
                                    <br />
                                    <Block alignContent='center' style={{ textAlign: "center" }}>
                                        <Heading subtitle size={5}>Latest version:</Heading>
                                        <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                            SHA-1 Hash: {entity.hash}
                                        </Content>

                                        {entity.updated_at != undefined ?
                                            <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                                Updated at: <b>{Moment(entity.updated_at * 1000).format('DD.MM.YYYY')}</b>. This date is <b>related to the AppImage</b> not the version of the application itself.
                                            </Content> : ""}

                                        <Button.Group align='center'>
                                            <a href={entity.file} target="_blank">
                                                <Button size={"medium"} color="success">
                                                    Download
                                                </Button>
                                            </a>
                                        </Button.Group>
                                    </Block>
                                    <br />
                                    <Block alignContent='center' style={{ textAlign: "center" }}>
                                        <Heading subtitle size={5}>Do not forget:</Heading>
                                        <Content className="has-text-weight-light" size={"small"} alignContent={"center"}>
                                            chmod +x ./{entity.package}
                                        </Content>
                                    </Block>
                                    <br />
                                    <Block alignContent='center' style={{ textAlign: "center" }}>
                                        <Heading subtitle size={5}>Categories:</Heading>
                                        {entity.groups.map((group, index) => (
                                            <a href={group.page} target="_blank">
                                                <Tag style={{ margin: "3px" }}>
                                                    <Image src={group.icon} size={16} />&nbsp;{group.name}
                                                </Tag>
                                            </a>
                                        ))}
                                    </Block>
                                </Box>

                            </Columns.Column>

                        </Columns>
                    </Columns.Column>
                    <Columns.Column size={12} centered={true}>
                        <Content className="has-text-weight-light"
                            dangerouslySetInnerHTML={{
                                __html: entity.description
                            }} size={"medium"} />
                        <br />
                    </Columns.Column>
                    <Columns.Column size={12} centered={true}>
                        <Heading size={3}>How to install</Heading>
                        <Content className="has-text-weight-light" size={"medium"} style={{ textAlign: "center" }}>
                            The installation process in all the cases is just a download a file and provide the execution permissions.
                            The main difference is how the desktop integration is done. Below you will find a few examples.
                        </Content>
                        <br />
                        <Block alignContent='center' style={{ textAlign: "left" }}>
                            <Heading subtitle size={5}>Official way</Heading>
                            <Content className="has-text-weight-light" size={"medium"} style={{ textAlign: "center" }}>
                                For the desktop integration you need to <a href='https://docs.appimage.org/user-guide/run-appimages.html#integrating-appimages-into-the-desktop'>install</a> some additional packages.
                            </Content>
                            <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                <pre>
                                    wget {entity.file} --output-document={entity.package}<br />
                                    chmod +x ./{entity.package}<br />
                                    ./{entity.package}<br />
                                </pre>
                            </Content>
                        </Block>
                        <br />
                        <Block alignContent='center' style={{ textAlign: "center" }}>
                            <Heading subtitle size={5}>Command line</Heading>
                            <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                <pre>
                                    wget {entity.file} --output-document={entity.package}<br />
                                    chmod +x ./{entity.package}<br />
                                    ./{entity.package}<br />
                                </pre>
                            </Content>
                        </Block>
                        <br />
                        <Block alignContent='center' style={{ textAlign: "center" }}>
                            <Heading subtitle size={5}>Go-appimage</Heading>
                            <Content className="has-text-weight-light" size={"medium"} style={{ textAlign: "center" }}>
                                For the desktop integration you need to <a href="https://github.com/probonopd/go-appimage/blob/master/src/appimaged/README.md#installation-and-usage">install</a> some additional packages.
                            </Content>
                            <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                <pre>
                                    wget {entity.file} --output-document={entity.package}<br />
                                    chmod +x ./{entity.package}<br />
                                    ./{entity.package}<br />
                                </pre>
                            </Content>
                        </Block>
                        <br />
                        <Block alignContent='center' style={{ textAlign: "center" }}>
                            <Heading subtitle size={5}>AppRepo</Heading>
                            <Content className="has-text-weight-light" size={"medium"} style={{ textAlign: "center" }}>
                                The desktop integration will be provided by <a href="https://apprepo.de/appimage/apprepo">this</a> package.
                            </Content>
                            <Content className="has-text-weight-light" size={"small"} style={{ textAlign: "left" }}>
                                <pre>
                                    wget https://apprepo.de/appimage/download/apprepo --output-document=Apprepo.AppImage<br />
                                    chmod +x ./Apprepo.AppImage<br />
                                    ./Apprepo.AppImage install {entity.slug}<br />
                                    ~/Applications/{entity.package}<br />
                                </pre>
                            </Content>
                        </Block>
                        <br />

                    </Columns.Column>
                </Columns>
                : <MessageLoading />}
        </>
    );
};
