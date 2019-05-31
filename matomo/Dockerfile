ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.9.1.tar.gz
ARG SHA512=8d92930c3ae99fce5c411b91fd78a0434cd3c807e9500776c5e75670e9aa78d39ae9206fbe1475d06d17256e5c8b38e8528e61413d4f73e078d1a2a01e25ba95
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
