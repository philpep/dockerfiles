ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=4.9.8
ARG DIST=wordpress-$VERSION.tar.gz
ARG URL=https://wordpress.org/$DIST
ARG SHA512=052b4436d8b5e5970ff6827b9f08f7f321301d187a9655e82ee1358f0012cc84a007f4ae04fecc4aaeb10a9e7eb9de7bc6643e6f0db57bb5983e7647e4230c41
USER root
RUN mkdir -p /data/wordpress
RUN wget -O $DIST $URL && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/wordpress --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/wordpress

ARG VERSION=2.0.1
ARG DIST=wp-cli-$VERSION.phar
ARG URL=https://github.com/wp-cli/wp-cli/releases/download/v$VERSION/$DIST
ARG SHA512=21b9c1d65993f88bf81cc73c0a832532cc424bea8c15563a77af1905d0dc4714f2af679dfadedd3b683f3968902b4b6be4c6cf94285da9f5582b30c1dac5397f
RUN wget -O /usr/local/bin/wp $URL && \
    echo "$SHA512  /usr/local/bin/wp" | sha512sum -c - && \
    chmod +x /usr/local/bin/wp
ENV WP_CLI_CONFIG_PATH=/etc/wp-cli.yml
RUN echo "path: /data/wordpress" > $WP_CLI_CONFIG_PATH
USER nobody
