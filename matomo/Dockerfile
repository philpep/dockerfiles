ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.5.tar.gz
ARG SHA512=ae7cd6b24cf85410e34d059f581c5451e1450e4759ac15e6839b551ed5ca8b7f5452bd9c6a94fed3a9f3bf835226f61bb6ae897b3dc20834c902e45a3a1730ed
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
