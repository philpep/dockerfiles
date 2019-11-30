ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.13.0.tar.gz
ARG SHA512=8ef9787229969751b6662d3299f6231c6fc78d3af64ffbc2e0f0e13cc9fc8e79661bb82e68dfa1419b43cabaf3a68a252602c4b69e91e55bee4bcd3664bc3f35
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
