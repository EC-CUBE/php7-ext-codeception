FROM php:7.1-cli

FROM codeception/codeception

MAINTAINER Kentaro Ohkouchi <nanasess@fsm.ne.jp>

RUN apt-get update && apt-get install --no-install-recommends -y \
        git curl wget sudo libfreetype6-dev libjpeg62-turbo-dev libxml2-dev mysql-client libicu-dev \
        && docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) \
        zip gd xml pdo pdo_mysql soap intl \
        && rm -r /var/lib/apt/lists/*
