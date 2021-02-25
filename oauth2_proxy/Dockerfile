ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
	ca-certificates \
	&& rm -rf /var/lib/apt/lists/*
ARG VERSION=v7.0.1
ARG DIST=oauth2-proxy-$VERSION.linux-amd64.tar.gz
ARG URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/$VERSION/$DIST
ARG SHA512=f29a50bc0064a3421fa3602d0c71b447e027ec5d3569361d52c67d94f0506d76ba41796070ae0641f3f55b802dc98330b4e0198c2d9f9f6c12415660b1eb83b4
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /usr/local/bin --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chmod +x /usr/local/bin/oauth2-proxy
USER 2000:2000
ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]
