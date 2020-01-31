ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache ca-certificates
ARG VERSION=v5.0.0
ARG DIST=oauth2_proxy-$VERSION.linux-amd64.go1.13.6.tar.gz
ARG URL=https://github.com/pusher/oauth2_proxy/releases/download/$VERSION/$DIST
ARG SHA512=be73e6b51265a398c51b5d0046814f6a35b63eeba844ad8fa23c366964307f7a370d24241b730e10b4ccab6b3772bf3763dca0fa33e0387ed82f4725ad53d3b8
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2_proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
