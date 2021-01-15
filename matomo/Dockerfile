ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.1.1.tar.gz
ARG SHA512=22a8e7b171bcc82d7121fdd0f51b0b409882e1762393f2a7db1019fce0cf1b12780d0e2b00d26048d01bedaabc556f863859011a44dc2ef1fd79e4aba1c122f4
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
