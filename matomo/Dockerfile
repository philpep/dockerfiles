ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.4.tar.gz
ARG SHA512=53b5b8eac777e081672beee858f4d8562bdd52499d2d9753c23467309f51a1c7bd8d8075a7f8e163df5fe43824b015c5d3bc0949837593723e3af584583b906a
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
