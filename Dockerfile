FROM ubuntu:latest

MAINTAINER Ayomide <bakkareayomide@gmail.com>
LABEL vendor="Ayomide Bakare"
LABEL tools="aws git python3 pip chrome node npm yarn"

# Install deps
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    git \
    groff-base \
    python3.7 \
    python3-pip \
    build-essential \
    --no-install-recommends

# Link python3.7 to python3 and ensure /usr/local/bin is before /usr/bin in PATH
RUN update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.7 1 && \
    export PATH=/usr/local/bin:$PATH

# Install aws cli
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade awscli

# Get Chrome sources
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Install Chrome
RUN apt-get update && apt-get install -y \
    google-chrome-stable \
    --no-install-recommends

# Get yarn sources
RUN curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb [arch=amd64] https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Install yarn pinned version
RUN apt-get update && apt-get install -y yarn --no-install-recommends

# Find your desired version here: https://deb.nodesource.com/node_10.x/pool/main/n/nodejs/
# Ubuntu 16.04.3 LTS (Xenial Xerus) (https://wiki.ubuntu.com/Releases)
RUN curl https://deb.nodesource.com/node_12.x/pool/main/n/nodejs/nodejs_12.14.1-1nodesource1_amd64.deb > node.deb \
    && dpkg -i node.deb \
    && rm node.deb