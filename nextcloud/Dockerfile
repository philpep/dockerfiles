ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apk add --no-cache php7-posix php7-pcntl php7-intl php7-pecl-redis
ARG VERSION=17.0.2
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=ea3788958b37e68c88e03d8a39c0284f14fb82e1e4e20f59df1d6acbdd2eb8a50f791ea48abbe2a91f9fa59de93237763f19ded441973bc2834a64721a210aa1
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
