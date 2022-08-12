ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
ARG VERSION=v7.3.0
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=b40ff354f170cb5e116d68c59602c9471fb6eaf75dea5dcb03d0ab4febfd5af82984fcc3a0972cb1cc0baf1541a97f2a919482f14afb7b08fbfb2024a090ba76
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
