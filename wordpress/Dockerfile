FROM r.philpep.org/php-fpm
ARG SRC=wordpress-4.9.7.tar.gz
ARG SHA=8514274c5d5b27f8d7c5fb39947d8afc947396940a8a4daffd4fb56c8bbf3b69
USER root
RUN wget -O $SRC https://wordpress.org/$SRC && \
    echo "$SHA  $SRC" | sha256sum -c - && \
    tar -C /data -xvzf $SRC && \
    chown -R root:root /data/wordpress && \
    rm -f $SRC
ARG CLI_VERSION=1.5.1
ARG CLI_SHA=8dd68c98c6fa00e1acc5e036f9393c8b052937045b5232e4aa0eb4f15773908eae48760607bc853a4f951bd5ba69e5050337e5d9dcfa48df87a12cebb1de3432
RUN wget -O /usr/local/bin/wp https://github.com/wp-cli/wp-cli/releases/download/v$CLI_VERSION/wp-cli-$CLI_VERSION.phar && \
    echo "$CLI_SHA  /usr/local/bin/wp" | sha512sum -c - && \
    chmod +x /usr/local/bin/wp
ENV WP_CLI_CONFIG_PATH=/etc/wp-cli.yml
RUN echo "path: /data/wordpress" > $WP_CLI_CONFIG_PATH
USER nobody
