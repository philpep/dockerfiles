ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.1.tar.gz
ARG SHA512=c1605a2d5b3b780ae1a68f6354412b8f885a2029bc438a928cbf780b09b4f3a67441093ef4a7527d40147221b0668e3f6337263b7a7a46ab9d850d97763e46c7
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
