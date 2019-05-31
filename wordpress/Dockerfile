ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
# python3 required for check_wordpress script
RUN apk add --no-cache python3
COPY check_wordpress /usr/local/bin/
RUN chmod +x /usr/local/bin/check_wordpress
ARG VERSION=5.2.1
ARG DIST=wordpress-$VERSION.tar.gz
ARG URL=https://wordpress.org/$DIST
ARG SHA512=b49368ba7a3f0cf101b2ad2c78d609050f371a4c7f6dca7d5966cc167ae20ca78df9a3144e1b91c4044d0a9a12163911d66c8faedc9c4a1e2978d2b54ef54855
RUN mkdir -p /data/wordpress
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/wordpress --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/wordpress

ARG VERSION=2.2.0
ARG DIST=wp-cli-$VERSION.phar
ARG URL=https://github.com/wp-cli/wp-cli/releases/download/v$VERSION/$DIST
ARG SHA512=2103f04a5014d629eaa42755815c9cec6bb489ed7b0ea6e77dedb309e8af098ab902b2f9c6369ae4b7cb8cc1f20fbb4dedcda83eb1d0c34b880fa6e8a3ae249d
RUN wget -O /usr/local/bin/wp $URL && \
    echo "expected SHA512=$(sha512sum /usr/local/bin/wp)" && \
    echo "$SHA512  /usr/local/bin/wp" | sha512sum -c - && \
    chmod +x /usr/local/bin/wp
ENV WP_CLI_CONFIG_PATH=/etc/wp-cli.yml
RUN echo "path: /data/wordpress" > $WP_CLI_CONFIG_PATH
USER nobody
