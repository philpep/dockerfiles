FROM r.philpep.org/php-fpm
ARG VERSION=1.3.7
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=2e6c1e94866750835d843b4f4ea77148e467dfbee3a15e20bd7c9086c11ad9919f0ddc6097c40cacfcdbc2ceacf2f6fb1b7e8546a7fcb9f20d0e5bf84283d724
USER root
# for password plugin
RUN apk add --no-cache dovecot
RUN mkdir -p /data/roundcube
RUN wget -O $DIST $URL && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/roundcube --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/roundcube
COPY index.html rc.png robots.txt /data/
USER nobody
