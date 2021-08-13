ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
ARG VERSION=v3.1.6
ARG DIST=$VERSION.tar.gz
ARG URL=https://github.com/electerious/Lychee/archive/$DIST
ARG SHA512=a489257c681c2973ae3683ca0059dddd8c53726c556333804e83c7f4dadfbabe9df363c95d59e12a785e3c1bed78e91930c8490097c963f9b14a1b608b041871
RUN mkdir -p /data/lychee
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/lychee --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/lychee
RUN echo "php_value[upload_max_filesize] = 10M" >> /etc/php/7.4/fpm/pool.d/www.conf
USER nobody
