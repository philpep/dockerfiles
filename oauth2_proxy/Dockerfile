ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
ARG VERSION=v7.2.1
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=6dd7e385163c440625ba6fe4e084fca8d2f8de0ab3b771cd79663920cde134ddd9996aaba00db3816abe8744d6014ce2c0ef8c8efe68d5db465c12deca7352da
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
