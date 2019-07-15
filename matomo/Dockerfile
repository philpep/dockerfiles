ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.10.0.tar.gz
ARG SHA512=60175c9e7de4b6cabf009c8bcb296b62be9ed0f610231a4fc9e5dddd4df182cbe1bdcfb96e780d6146ddf3b89b6675d3240f2770e317c2f882601d41f0af2bc9
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
