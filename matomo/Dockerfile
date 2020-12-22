ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.1.0.tar.gz
ARG SHA512=408f8bfe125c7ca406e30aae14ddc5cf5a1aa7b4a6a9a698c13550a764563397fda44e229a5fd94cb2cc2027565f301d7fe48b16518baf1eccbc61f114b2f0e0
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
