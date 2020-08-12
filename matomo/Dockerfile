ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.14.0.tar.gz
ARG SHA512=a85ad11c83cf32a2be3256da57adf6fc481d5fe1733d2798a6c5def2ad548d780a94f74a26da2aa24dd87e2ce0a8e4acb1ee6dbe8052c5b96812d367bfb569f9
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
