ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.0.5.tar.gz
ARG SHA512=440a3ea272971283cc30a3f0b145244dbf2362e5d9e12ac46b6cb5cd5ba2777c6a196d3753ceaf509abe0ef382d2ee295ce9eba00ba536f924b584991b1b01c8
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
