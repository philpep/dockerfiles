ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apk add --no-cache php7-posix php7-pcntl php7-intl php7-pecl-redis
ARG VERSION=19.0.3
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=be4f489903ca7f777bda541a706d4c4f16a2a3ce56abc65525f72b0464592571ccdd9f8915457450ce37f90d51c944cab5c75b100433e3db3dcc154362c4d76f
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
