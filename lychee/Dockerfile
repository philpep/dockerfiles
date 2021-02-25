ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
ARG VERSION=v4.2.2
ARG DIST=$VERSION.tar.gz
ARG URL=https://github.com/LycheeOrg/Lychee/archive/$DIST
ARG SHA512=ba0b8b59233a5b0e499b5ac512110574bc642eb8adb812c1facfa56ab4d5a0c9f6fe53be0287097b2e4407922ee93f5ece10eab35ac69a7408e8f34bd7243bc4
RUN mkdir -p /data/lychee
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/lychee --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/lychee
RUN echo "php_value[upload_max_filesize] = 10M" >> /etc/php/7.3/fpm/pool.d/www.conf
USER nobody
