ARG REGISTRY
FROM $REGISTRY/alpine:3.10
ARG DIST=index.php
ARG URL=https://raw.githubusercontent.com/tontof/kriss_feed/master/index.php
ARG SHA512=b0d168a4fc5c79cdd9673b6cadf7189f1e7003ccb288c01e231849b90d22944bbd4fab3b19596aecfb0a404228053822724eb23b8b4a9507bbc5222f0521d488
USER root
RUN mkdir -p /data/feed
RUN wget -O /data/feed/index.php $URL && \
    echo "$SHA512  /data/feed/index.php" | sha512sum -c -
USER nobody
