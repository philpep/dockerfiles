ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache ca-certificates
ARG VERSION=v4.0.0
ARG DIST=oauth2_proxy-$VERSION.linux-amd64.go1.12.1.tar.gz
ARG URL=https://github.com/pusher/oauth2_proxy/releases/download/$VERSION/$DIST
ARG SHA512=53305ee0936368005776cbf275ec84be8308289a27683d39ac3a1d97468ac4f421fe2830f2b408d3fc122cc3902c7f0013b2fd7a8c9dbb1db0abfb1d05978bfc
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2_proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
