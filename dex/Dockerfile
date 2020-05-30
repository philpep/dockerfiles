ARG REGISTRY
FROM $REGISTRY/alpine:3.12 as builder
RUN apk add --no-cache go make git
RUN adduser -D -u 1000 -h /home/user user
USER user
RUN mkdir -p /home/user/go/src/github.com/dex
WORKDIR /home/user/go/src/github.com/dex
ARG VERSION=2.24.0
ARG DIST=v$VERSION.tar.gz
ARG URL=https://github.com/dexidp/dex/archive/$DIST
ARG SHA512=af16fa788dc4b6bef6bbf53adb6f9a0fa42dde154e4b9d89ae1113f8085570b7b800d697acd7dbbdda5656f9a5c6dd9df7de9a43c0ae5f3dff8b0b736c0c884a
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /home/user/go/src/github.com/dex --strip-components=1 -xvzf $DIST && \
    rm -f $DIST
RUN go build -o ~/go/bin/dex -v -ldflags "-w -X github.com/dexidp/dex/version.Version=$VERSION" github.com/dexidp/dex/cmd/dex

ARG REGISTRY
FROM $REGISTRY/alpine:3.12
RUN apk add --no-cache ca-certificates openssl
COPY --from=builder /home/user/go/bin/dex /usr/local/bin/dex
COPY --from=builder /home/user/go/src/github.com/dex/web /home/user/web
COPY config.yaml /
RUN adduser -D -u 1000 user
USER user
WORKDIR /home/user
ENTRYPOINT ["/usr/local/bin/dex"]
CMD ["serve", "/config.yaml"]
