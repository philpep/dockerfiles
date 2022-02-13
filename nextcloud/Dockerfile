ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apt-get update && apt-get -y install \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
ARG VERSION=23.0.0
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=fba9f03c37a4d3f5e44472218fc50a49157872ae7c1aaaa3bc0c1c0301a97394690f75cf03cd11b3f9b0f282fef29eea189fa52ee5019f40a0d6f671ddda6706
RUN mkdir -p /data/nextcloud
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/nextcloud --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/nextcloud
RUN chmod +x /data/nextcloud/occ
USER nobody
WORKDIR /data/nextcloud
RUN ./occ maintenance:install --admin-pass=dummy --no-interaction && \
    ./occ app:update --all && \
    ./occ app:install calendar && \
    ./occ app:install oidc_login && \
    ./occ app:install sentry && \
    rm -rf data config/config.php
