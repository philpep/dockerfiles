ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache ca-certificates
ARG VERSION=v5.1.0
ARG DIST=oauth2_proxy-$VERSION.linux-amd64.go1.14.tar.gz
ARG URL=https://github.com/pusher/oauth2_proxy/releases/download/$VERSION/$DIST
ARG SHA512=6ccdee92a800eaab36f8cab966fcea26dd4260203e423870ce4f6cfe8c241aeccd717822cc8ba42ea026f6b4527c871d8edf55db43c19fc84d7a6ac2d5e04def
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2_proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
