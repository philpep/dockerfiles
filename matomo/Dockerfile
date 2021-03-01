ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.2.1.tar.gz
ARG SHA512=ebb71bf7bda8f2eb7164a802685967ea89ab855d487a321b5a1d4dbd76840bc0305f4bb5b13cbfe9431d9c34eff09142a9a23b810df7449bd5f56bb2da3b0d34
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
