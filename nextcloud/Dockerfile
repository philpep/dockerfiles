ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apk add --no-cache php7-posix php7-pcntl php7-intl php7-pecl-redis
ARG VERSION=18.0.4
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=c9754562153fdb07e0c65d5cc9749871c875a455051cd632403c31b8cb52540b95f3fdf5ba3146d65a175508580b6f3c72d3ac86a90b060baafbca1225dbba95
RUN mkdir -p /data/nextcloud
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/nextcloud --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/nextcloud
RUN chmod +x /data/nextcloud/occ
USER nobody
WORKDIR /data/nextcloud
RUN ./occ maintenance:install --admin-pass=dummy --no-interaction && \
    ./occ app:update --all && \
    ./occ app:install calendar && \
    ./occ app:install oidc_login && \
    ./occ app:install sentry && \
    rm -rf data config/config.php
