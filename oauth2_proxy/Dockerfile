ARG REGISTRY
FROM $REGISTRY/alpine:3.12
RUN apk add --no-cache ca-certificates
ARG VERSION=v5.1.1
ARG DIST=oauth2_proxy-$VERSION.linux-amd64.go1.14.2.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=4250de0e1651e8c001255f5df4b8e0c4ef93b8c4309a4d894e8518f40873ed273ad72feb1406d9da32dd566a2d1c4c14a3f6a0a15c96e1478aa823751843cfe4
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2_proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
