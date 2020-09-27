ARG REGISTRY
FROM $REGISTRY/alpine:3.12 as builder
RUN apk add --no-cache go make git
RUN adduser -D -u 1000 -h /home/user user
USER user
RUN mkdir -p /home/user/go/src/github.com/dex
WORKDIR /home/user/go/src/github.com/dex
ARG VERSION=2.25.0
ARG DIST=v$VERSION.tar.gz
ARG URL=https://github.com/dexidp/dex/archive/$DIST
ARG SHA512=096732e537dade0c6ef9517118df583a858da1b67cffbb92837453da9df8c5dc1f56bf55e7789533871c3d96d007971e33cd3b1fe40d13a13a505a6c82be26a2
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
