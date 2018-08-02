FROM r.philpep.org/php-fpm
ARG SRC=wordpress-4.9.7.tar.gz
ARG SHA=8514274c5d5b27f8d7c5fb39947d8afc947396940a8a4daffd4fb56c8bbf3b69
USER root
RUN wget -O $SRC https://wordpress.org/$SRC && \
    echo "$SHA  $SRC" | sha256sum -c - && \
    tar -C /data -xvzf $SRC && \
    chown -R root:root /data/wordpress && \
    rm -f $SRC
USER nobody
