FROM ubuntu:20.04

LABEL maintainer="Christopher David Heanan"

ENV DEBIAN_FRONTEND=noninteractiv

RUN apt -qq update && apt install -y locales && locale-gen en_US.UTF-8 && apt clean

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update Ubuntu Software repository
RUN apt install -y \
    curl \
    build-essential \
    git \
    rsync \
    tzdata \
    software-properties-common \
    libpng-dev \
    sqlite3 \
    libsqlite3-dev \
    apt-transport-https

RUN add-apt-repository ppa:ondrej/php
RUN apt -qq update
RUN apt install -y \
    php7.4 \
    php7.4-sqlite3 \
    php7.4-cli \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-common \
    php7.4-curl \
    php7.4-intl \
    php7.4-zip

#Install nvm & yarn
ENV NVM_VERSION v0.35.3

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
RUN source ~/.nvm/nvm.sh; \
    nvm install node; \
    nvm use node; \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    apt -qq update; \
    apt install -y --no-install-recommends yarn; \
    yarn --version;

#Install composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php

#Cleanup
RUN apt purge -y software-properties-common \
    && apt autoclean \
    && apt clean \
    && apt -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

