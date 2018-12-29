ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.7.0.tar.gz
ARG SHA512=b905cd60ed04afafdc56f17aaa9b6524f4f09bf2b3ea8bef4fd6b9cb298e1dc4557d1e753b770149311040a378f9d1d89e5f0f2fea8d5da303e284c738056cd7
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
