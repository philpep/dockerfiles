ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.3.3
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=363b91eb07f263a0f595e020725cacf9f9de058adaef3987efb3257d0e6fba526b075f8328e47763256278797ec946305d1e4c8ff5c55d77753f9ed72bfa4121
USER root
# dovecotpw for password generation
RUN apt-get update && apt-get -y install --no-install-recommends \
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
