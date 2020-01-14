# Node, Python, ChromeHeadless, AWS based on Linux (Ubuntu 18.04 bionic)

## Description

This image is maintained by mbao01 and its main purpose is a CI build environment for projects.

## Installed Tools and versions

- aws (awscli)
- git v2.24.1
- python v3.7
- pip v19.2.3
- chrome v78
- node v12.4.1 (LTS)
- npm v6.13.6
- yarn v1.21.1 (stable)

## How to test locally?

- Make changes in Dockerfile
- Run following command in the folder where the Dockerfile is located
- `docker build .`
- You can add debug outputs temporary at the end of the Dockerfile, e.g. `RUN node -v`

## How to release a new Version?

- This Dockerfile is automatically built and released on [Docker Hub](https://hub.docker.com/repository/docker/mbao01/node-python-chromeheadless-aws)
- Builds are triggered by released tags on github
- Login to Docker Hub is done via personalized accounts, which have to be connected to [mbao01](https://hub.docker.com/u/mbao01/)

## How to install a specific version of node?

1. Find your desired version here: [https://deb.nodesource.com/node_12.x/pool/main/n/nodejs/](https://deb.nodesource.com/node_12.x/pool/main/n/nodejs/)
1. Replace .deb url in Dockerfile

## Changelog

- **2020-01-14**: `Chrome 78`, `node 12.14.1`, `yarn 1.21.1`
