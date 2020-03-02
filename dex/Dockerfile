ARG REGISTRY
FROM $REGISTRY/alpine:3.11 as builder
RUN apk add --no-cache go make git
RUN adduser -D -u 1000 -h /home/user user
USER user
RUN mkdir -p /home/user/go/src/github.com/dex
WORKDIR /home/user/go/src/github.com/dex
ARG VERSION=2.22.0
ARG DIST=v$VERSION.tar.gz
ARG URL=https://github.com/dexidp/dex/archive/$DIST
ARG SHA512=3ddacf517e65a2ff32015ba8a31ac2279f4bd031a272fa5539625021f3b579087a40612e2d3e2f0a667ead696f006c6529d6285ccaa8a0443baf2e796a65f404
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /home/user/go/src/github.com/dex --strip-components=1 -xvzf $DIST && \
    rm -f $DIST
RUN go build -o ~/go/bin/dex -v -ldflags "-w -X github.com/dexidp/dex/version.Version=$VERSION" github.com/dexidp/dex/cmd/dex

ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache ca-certificates openssl
COPY --from=builder /home/user/go/bin/dex /usr/local/bin/dex
COPY --from=builder /home/user/go/src/github.com/dex/web /home/user/web
COPY config.yaml /
RUN adduser -D -u 1000 user
USER user
WORKDIR /home/user
ENTRYPOINT ["/usr/local/bin/dex"]
CMD ["serve", "/config.yaml"]
