ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.3.10
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=e00fc9ea343a928976d191adfa01020ee0c6ddbe80a39e01ca2ee414a18247958f033970f378fe4a9974636172a5e094e57117ee9ac7b930c592f433097a7aca
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
