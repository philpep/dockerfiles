ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.5.1
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=bcea37859fbbee2f474cda024e5648b823a2da44ae69e5036a5b7e6add1d73dbfc1cd1cc32a3e01e59b0a3ba2ea03d1b028eec8e8f139fc4fb3eea8b52e28203
USER root
# dovecotpw for password generation
RUN apt-get update && apt-get -y install \
    dovecot-core \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data/roundcube
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/roundcube --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/roundcube
COPY index.html rc.png robots.txt /data/
USER nobody
