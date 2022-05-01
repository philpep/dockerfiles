ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apt-get update && apt-get -y install \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
ARG VERSION=23.0.4
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=f43acf7c9df6e3105d9085bf9b4c95eebca83812980b933cd57920dec5684c34fe47e8f5395aa7eed806c75f13049790a30b2f8abce8738f9e8a55b24280871f
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
