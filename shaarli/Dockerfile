FROM r.philpep.org/php-fpm
ARG SRC=shaarli-v0.10.0-full.tar.gz
ARG SHA=e6de21042f3f277f4648293fa9db3740dbc6815640126e914f3a3cf95d44f148
USER root
RUN wget -O $SRC https://github.com/shaarli/Shaarli/releases/download/v0.10.0/$SRC && \
    echo "$SHA  $SRC" | sha256sum -c - && \
    tar -C /data -xvzf $SRC && \
    rm -f $SRC
USER nobody
