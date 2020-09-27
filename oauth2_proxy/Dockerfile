ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
	ca-certificates \
	&& rm -rf /var/lib/apt/lists/*
ARG VERSION=v6.1.1
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=29105d05ec57f8d3b8a227639081d4e35fddaf42995e0b7e38d9fc1dcc292456de341a93424c3f7fffd9feec1efb44dc900be6a1df1cfa2e2761a353f4978ad5
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
