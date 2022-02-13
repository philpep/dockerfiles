ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.7.1.tar.gz
ARG SHA512=ed6ce048e80616526b03497b8481301466e70ddc502fd62beeaea8ceccd5cb5fbc333f744629e8fe04842ef98cb7b40f58df173fafd5a93aa36c43a7521b5f0c
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
