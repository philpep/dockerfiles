ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
# python3 required for check_wordpress script
RUN apk add --no-cache python3
COPY check_wordpress /usr/local/bin/
RUN chmod +x /usr/local/bin/check_wordpress
ARG VERSION=5.2.4
ARG DIST=wordpress-$VERSION.tar.gz
ARG URL=https://wordpress.org/$DIST
ARG SHA512=eaf6e1555f13e4fe1f1a99691b271e658d9a83ab5fa7de1480987875565aab45d246bf8bb2e9828bd43979b96a0fb0db1ebf61c62c4967d9af08a370bef083e0
RUN mkdir -p /data/wordpress
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/wordpress --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/wordpress

ARG VERSION=2.3.0
ARG DIST=wp-cli-$VERSION.phar
ARG URL=https://github.com/wp-cli/wp-cli/releases/download/v$VERSION/$DIST
ARG SHA512=fdf1c6e7d33665fc9c6202a91fdebc72be6ebad12949ecf0280765bf24819e7ca2072e6834abd3848bceaae0f7aa1896322c837ae5a5b66dd69b760c310e4a30
RUN wget -O /usr/local/bin/wp $URL && \
    echo "expected SHA512=$(sha512sum /usr/local/bin/wp)" && \
    echo "$SHA512  /usr/local/bin/wp" | sha512sum -c - && \
    chmod +x /usr/local/bin/wp
ENV WP_CLI_CONFIG_PATH=/etc/wp-cli.yml
RUN echo "path: /data/wordpress" > $WP_CLI_CONFIG_PATH
USER nobody
