ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.8.1.tar.gz
ARG SHA512=77a9648295f182241a4b19aff6fa82ea632325f9cffb0f650ca43e7ca27692f47d63654fc0a9986591b279c7575ea30738e489dff7c2049a69f83f5044d9e669
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
