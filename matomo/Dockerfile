ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.4.1.tar.gz
ARG SHA512=36150543656eb99318e2e76ffd2c051e2772b199f63fe9b06899937f650d4c2e48dba79f39a24e5abc55a4e9ef85fff0ed18691d3d86e952ae462a8fae8d2d13
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
