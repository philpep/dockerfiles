ARG REGISTRY
FROM $REGISTRY/debian:buster-slim as build
WORKDIR /tmp
ARG VERSION=2.43
ARG DIST=linux_amd64.tar.gz
ARG SHA512=0151a50f05c800ec409b583bbe367ca33dae90621373feff464c2f690c8b69c8a513bf1ddaf94693f208e6f41b0f954ea0bcc02d8717d043c9ac71def6782733
RUN wget https://github.com/chrislusf/seaweedfs/releases/download/$VERSION/$DIST && \
    tar xvf $DIST && \
    rm -f linux_amd64.tar.gz && \
    echo "expected SHA512=$(sha512sum weed)" && \
    echo "$SHA512  weed" | sha512sum -c - && \
    mv weed /usr/bin/weed
RUN useradd --home /var/lib/seaweedfs --shell /bin/bash seaweedfs
USER seaweedfs
WORKDIR /var/lib/seaweedfs
ENTRYPOINT ["/usr/bin/weed", "-logtostderr"]
