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
    # Fixes: Module php-imagick in this instance has no SVG support. For better compatibility it is recommended to install it.
    libmagickcore-6.q16-6-extra \
    php-gd \
    php-bcmath \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i "s@error_log =.*@error_log = /dev/stderr@g" /etc/php/7.4/fpm/php-fpm.conf
RUN sed -i "s@pid =.*@;pid = /dev/null@g" /etc/php/7.4/fpm/php-fpm.conf
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN install -o nobody -g nogroup -m 777 -d /data/tmp
# Fixes: OC\HintException: [0]: Memcache \OC\Memcache\APCu not available for local cache (Is the matching PHP module installed and enabled?)
RUN /bin/echo -ne "[apc]\napc.enable_cli = 1\n" >> /etc/php/7.4/cli/php.ini
USER nobody
EXPOSE 9000/tcp
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize", "--force-stderr"]
