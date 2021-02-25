ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.3.7
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=c635b885235f2683532ff4fcd6d3e123fa5af8314cfcdbcdf412d7242444bb9c040a6eeb2f6b0669b9f5dd9fc56c53127779727768c68699885cc642717453ca
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
