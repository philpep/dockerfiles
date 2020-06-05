ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.6.tar.gz
ARG SHA512=664c7e0df01689a353bc2dca7b1a4e9b54ef7ac42e58bef87cb28c8b4a806662d8b594cade8e5ab4c5acd1acdda17012bff8b27c8447d2e56ea1cfc556aa4724
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
