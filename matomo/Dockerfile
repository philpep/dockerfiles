ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.3.tar.gz
ARG SHA512=2c2c9e17e0ed80c62e5fd4ff565af35892f974c67b2e8a8146ebbeb15deeaa83f1db8edd541dd0a3e33ffc719d1032fa0b27f77d28d800bdc6a38ac2fdab5592
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
