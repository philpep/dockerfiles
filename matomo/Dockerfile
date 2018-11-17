ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.6.1.tar.gz
ARG SHA512=9e5f059a31ce44ae02462c7c1f98f0b00d8ed1f83cde8ea430b7f251c9d23a9ff0afb4014d08cdbdcff42896570fbc32e82be4ff94f60ebd3e46eab9e503abef
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
