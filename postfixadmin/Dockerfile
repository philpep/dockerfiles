ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.3.11
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=84b22fd1d162f723440fbfb9e20c01d7ddc7481556e340a80fda66658687878fd1668d164a216daed9badf4d2e308c958b0f678f7a4dc6a2af748e435a066072
USER root
# dovecotpw for password generation
RUN apt-get update && apt-get -y install \
    dovecot-core \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data/postfixadmin
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/postfixadmin --strip-components=1 -xvzf $DIST && \
    rm -f $DIST
RUN install -d -o nobody -g nogroup /data/postfixadmin/templates_c
# enable proc_open
RUN sed -i 's@,proc_open@@g' /etc/php/7.4/fpm/pool.d/www.conf
USER nobody
