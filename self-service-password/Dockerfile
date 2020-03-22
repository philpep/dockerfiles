ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.3
ARG DIST=v$VERSION.tar.gz
ARG URL=https://github.com/ltb-project/self-service-password/archive/$DIST
ARG SHA512=15235bb5488180ae402d2ad4ab78f66234ba02975d90a1ed6222f959e3ec5e2ee33fc6526beb33229f14330cab7f030d4032f421461cc24f9c8595aa42e0fc00
USER root
RUN mkdir -p /data/ssp
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/ssp --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/ssp
USER nobody
