ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-3.12.0.tar.gz
ARG SHA512=64d59cbe665e22cab284f1e7b088bee9ae7d137ae2fd1b98d840e65d596d98705ca927c20a7c2807bc151f830fac15bb25620df33b60c506db5c2f8160940acb
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nobody /data/matomo && \
    rm -f $SRC
USER nobody
