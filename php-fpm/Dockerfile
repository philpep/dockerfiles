ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache \
    less \
    php7-mcrypt \
    php7-soap \
    php7-openssl \
    php7-gmp \
    php7-pdo_odbc \
    php7-json \
    php7-dom \
    php7-pdo \
    php7-zip \
    php7-mysqli \
    php7-sqlite3 \
    php7-pdo_pgsql \
    php7-pgsql \
    php7-bcmath \
    php7-gd \
    php7-odbc \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-gettext \
    php7-xmlreader \
    php7-xmlrpc \
    php7-bz2 \
    php7-iconv \
    php7-pdo_dblib \
    php7-curl \
    php7-ctype \
    php7-session \
    php7-memcached \
    php7-mbstring \
    php7-opcache \
    php7-apcu \
    php7 \
    php7-phar \
    php7-simplexml \
    php7-xml \
    php7-fpm
RUN sed -i "s@;error_log =.*@error_log = /dev/stderr@g" /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
RUN install -o nobody -g nobody -m 777 -d /data/tmp
USER nobody
EXPOSE 9000/tcp
CMD ["/usr/sbin/php-fpm7", "--nodaemonize", "--force-stderr"]
