ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.2.0.tar.gz
ARG SHA512=9a355ee96fcab2704567bf381bcc4c2fd965b56af9766032bed9ed326a3bd9159a32c9d38f302684497864cbb71c4184424172d494648ac37645e6e53e790029
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
