FROM php:8.4.3-apache-bookworm

# some obligatory packages
RUN apt update -y && apt install -y procps git vim

# HACK AHEAD: for graceful start of apache2, we need to add missing ENV vars, since source /etc/apache2/envvars doesnt help
ENV APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_PID_FILE=/var/run/apache2/apache2.pid \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_RUN_GROUP=www-data \
    APACHE_RUN_USER=www-data \
    LANG=C

# install mod_rewrite and add some fixes and obligatory settings for apache2
RUN sed -i 's/Options Indexes FollowSymLinks/Options FollowSymLinks/' /etc/apache2/apache2.conf \
    && echo "AddDefaultCharset UTF-8" >> /etc/apache2/conf-available/charset.conf \
    && a2enmod rewrite

# add rewrites for this app
COPY config/symfony.vhost.prod.conf /etc/apache2/sites-enabled/000-default.conf

# fix the FQDN error of apache, set servername for rewrites
ARG serverName
RUN echo "ServerName ${serverName}" >> /etc/apache2/apache2.conf \
    && sed -i "s~%servername%~${serverName}~" /etc/apache2/sites-enabled/000-default.conf

# git config
ARG gitUserEmail
ARG gitUserName

RUN git config --global user.email "${gitUserEmail}" \
    && git config --global user.name "${gitUserName}"

# symfony cli and command 'symfony'
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && echo 'alias symfony="/root/.symfony5/bin/symfony"' >> ~/.bashrc \
    && echo '#!/bin/sh' >> /bin/symfony \
    && echo '/root/.symfony5/bin/symfony "$@"' >> /bin/symfony \
    && chmod u+x /bin/symfony

# php settings
RUN sed -i 's/;zend_extension=opcache/zend_extension=opcache/' $PHP_INI_DIR/php.ini-production \
    && sed -i 's/;opcache.enable=1/opcache.enable=1/' $PHP_INI_DIR/php.ini-production \
    && sed -i 's/;opcache.save_comments=1/opcache.save_comments=1/' $PHP_INI_DIR/php.ini-production \
    && sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/' $PHP_INI_DIR/php.ini-production \
    && sed -i 's/;opcache.use_cwd=1/opcache.use_cwd=1/' $PHP_INI_DIR/php.ini-production \
    && sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=128/' $PHP_INI_DIR/php.ini-production \
    && mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini