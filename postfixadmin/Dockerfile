ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=3.2.4
ARG DIST=postfixadmin-$VERSION.tar.gz
ARG URL=https://github.com/postfixadmin/postfixadmin/archive/$DIST
ARG SHA512=2bd7ae05addbaf3c6c7eebea16ec1e21b2c67c8e6161446ed82a9553c26c04e19c1ec9ce248a9b9df504df56d309590259e6f04907b04b593548028b40e40d47
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
