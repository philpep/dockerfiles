ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.3.8
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=bfe5d874083568f1e8b1830394338d2aa29e39e30834d4c8c728836495f12f6d49c65b83b1fae1fce20e7456afaef0058320033866b720a5858911ceec22a022
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
RUN sed -i 's@,proc_open@@g' /etc/php/7.3/fpm/pool.d/www.conf
USER nobody
