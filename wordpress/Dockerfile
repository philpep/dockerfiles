ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
# python3 required for check_wordpress script
RUN apt-get update && apt-get -y install --no-install-recommends \
    python3 \
    && rm -rf /var/lib/apt/lists/*
COPY check_wordpress /usr/local/bin/
RUN chmod +x /usr/local/bin/check_wordpress
ARG VERSION=5.6.2
ARG DIST=wordpress-$VERSION.tar.gz
ARG URL=https://wordpress.org/$DIST
ARG SHA512=5602104cdaaaf354f0b24782ceb0b32b8a8af5e4a9d698376a9ac263bc77f0c5d461d40587e0010e63e97c3d415db6ad3aead6069bba5ebcba03e783fbacbb69
RUN mkdir -p /data/wordpress
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/wordpress --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/wordpress

ARG VERSION=2.4.0
ARG DIST=wp-cli-$VERSION.phar
ARG URL=https://github.com/wp-cli/wp-cli/releases/download/v$VERSION/$DIST
ARG SHA512=4049c7e45e14276a70a41c3b0864be7a6a8cfa8ea65ebac8b184a4f503a91baa1a0d29260d03248bc74aef70729824330fb6b396336172a624332e16f64e37ef
RUN wget -O /usr/local/bin/wp $URL && \
    echo "expected SHA512=$(sha512sum /usr/local/bin/wp)" && \
    echo "$SHA512  /usr/local/bin/wp" | sha512sum -c - && \
    chmod +x /usr/local/bin/wp
ENV WP_CLI_CONFIG_PATH=/etc/wp-cli.yml
RUN echo "path: /data/wordpress" > $WP_CLI_CONFIG_PATH
USER nobody
