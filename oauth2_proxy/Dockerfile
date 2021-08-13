ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
ARG VERSION=v7.1.3
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=15877cb6c58a00d64037f685ee1219bb51885522b428e88c5deda58daa10138e1d4c51b28b9ba2129142dd122923c29e1e5fa5b1ece7a8447b7e381e0f81ea71
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
