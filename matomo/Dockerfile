ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.14.1.tar.gz
ARG SHA512=0f7d59d2e8ed395cdb82cd53fc84573423ef2b72f04db554473de245811c01d0eee1b9ee906db88dcc2fbf93c7787e4adee9bb7c2d6886d9093e79b9aa32b1cb
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
