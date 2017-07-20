#Download base image ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Chris Heanan

RUN apt-get clean && apt-get -y update && apt-get install -y locales && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update Ubuntu Software repository
RUN apt-get update \
    && apt-get install -y curl zip unzip git software-properties-common \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y sqlite3 libsqlite3-dev \
    && apt-get install -y php7.1 php7.1-sqlite3 php7.1-cli php7.1-mbstring php7.1-xml php7.1-common php7.1-curl

#Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install -y nodejs build-essential

#Install composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php
    
#Cleanup
RUN apt-get purge -y software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

