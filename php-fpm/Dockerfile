ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    php-fpm \
    php-soap \
    php-gmp \
    php-zip \
    php-mysql \
    php-sqlite3 \
    php-pgsql \
    php-php-gettext \
    php-xml \
    php-xmlrpc \
    php-bz2 \
    php-curl \
    php-memcached \
    php-redis \
    php-mbstring \
    php7.4-opcache \
    php-apcu \
    php-intl \
    php-imagick \
    php-gd \
    php-bcmath \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i "s@error_log =.*@error_log = /dev/stderr@g" /etc/php/7.4/fpm/php-fpm.conf
RUN sed -i "s@pid =.*@;pid = /dev/null@g" /etc/php/7.4/fpm/php-fpm.conf
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN install -o nobody -g nogroup -m 777 -d /data/tmp
USER nobody
EXPOSE 9000/tcp
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize", "--force-stderr"]
