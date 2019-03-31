# Download base image ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Chris Heanan

RUN apt-get clean && apt-get -y -qq update && apt-get install -y locales && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update Ubuntu Software repository
RUN apt-get update -qq \
    && apt-get install -y curl zip unzip git software-properties-common libpng-dev \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update -qq \
    && apt-get install -y sqlite3 libsqlite3-dev \
    && apt-get install -y php7.2 php7.2-sqlite3 php7.2-cli php7.2-mbstring php7.2-xml php7.2-common php7.2-curl php7.2-intl

#Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash \
    && apt-get install -y nodejs build-essential

# Install yarn
RUN apt-get update && apt-get install -y apt-transport-https \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get -qq update && apt-get install yarn

#Install composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php

#Cleanup
RUN apt-get purge -y software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

