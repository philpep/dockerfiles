ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.2.tar.gz
ARG SHA512=ad1bbef0967c28794de1933936da1432154b16ad2141d9d6f08f7f7376639835623b2bfdbba5ec7f9da29277de7972ff2064e8c3fccc21c700ea752afdc3f064
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
