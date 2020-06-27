ARG REGISTRY
FROM $REGISTRY/alpine:3.12
RUN apk add --no-cache ca-certificates
ARG VERSION=v6.0.0
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.go1.14.2.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=3760b1f52f7f389daff50248a74d42652277085888ecc2d63871c98ab3d5d010630aa8d3089eadf329e9741bec8a1a25b629fc9f61556cdb2d75ab49d66fd9e2
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
