FROM php:8.4.3-apache-bookworm

RUN apt update -y && apt install -y procps git

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && echo 'alias symfony="/root/.symfony5/bin/symfony"' >> ~/.bashrc