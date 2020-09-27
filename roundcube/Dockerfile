ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.9
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=c6395757544b85693e808234f3dc6baac618ba115fb2c9eefc309ee18e74b2fdfbc0af00ac2b3b980fdd2abc56eefde47b535cdf688cfd2a5ce975786aca6572
USER root
# for password plugin
RUN apk add --no-cache dovecot
RUN mkdir -p /data/roundcube
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/roundcube --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/roundcube
COPY index.html rc.png robots.txt /data/
USER nobody
