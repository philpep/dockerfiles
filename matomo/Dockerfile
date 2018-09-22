ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.6.0.tar.gz
ARG SHA=e8d2297fc9e11e0980b0399a6c14330c551b965afaa89a4ee140103d4c507dae
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "$SHA  $SRC" | sha256sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
