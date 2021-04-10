ARG REGISTRY
FROM $REGISTRY/debian:buster-slim as build
RUN apt-get update && apt-get -y install \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp
ARG DIST=linux_amd64.tar.gz
ARG SHA512=11bd5c704aecc9483fd8d080f2fc4004fa1cacd6f8d28c64efa6f1e9c89ef74e70f98fe31c34facface7a889e789bf8a600a5fbb3ded1201be6b503306202bbb
RUN wget https://github.com/chrislusf/seaweedfs/releases/download/2.38/$DIST && \
    tar xvf $DIST && \
    rm -f linux_amd64.tar.gz && \
    echo "expected SHA512=$(sha512sum weed)" && \
    echo "$SHA512  weed" | sha512sum -c - && \
    mv weed /usr/bin/weed
RUN useradd --home /var/lib/seaweedfs --shell /bin/bash seaweedfs
USER seaweedfs
WORKDIR seaweedfs
ENTRYPOINT ["/usr/bin/weed", "-logtostderr"]
