ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
ARG VERSION=v7.1.2
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=62f8bce09c18a1c5b97cfa36cf1ff14cdc53b94a11bf0116187c56120978cffd332a36a011512dc6578de91af7b8a4069e8ef412ae58fe9376f4a636db8147b8
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
