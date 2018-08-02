FROM r.philpep.org/php-fpm
ARG SRC=piwik-3.5.1.tar.gz
ARG SHA=d5b7b851861404dd804e3e1cf8fafcbd9901668ae8e7cf39348d4030b87ad945
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "$SHA  $SRC" | sha256sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R root:root /data/matomo && \
    rm -f $SRC
USER nobody
