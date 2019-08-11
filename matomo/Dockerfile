ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.11.0.tar.gz
ARG SHA512=9d294022e32c520efe34cfb42fd7db1a717556e2df3c2cff1ce04d9921eceeab461ee0cb095e3da7ac6d88d81e75ae8fce3b3dba5afddce1ed54d7507fd96870
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
