ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=shaarli-v0.10.2-full.tar.gz
ARG SHA512=901d596358063b559c835d6384766601debeff8c641fb51c75c1179466079e1febee83e042900bf0a39b79ab4dd42bee83fa92a583650d3c0b69d8ea9b22bc22
USER root
RUN wget -O $SRC https://github.com/shaarli/Shaarli/releases/download/v0.10.2/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data -xvzf $SRC && \
    rm -f $SRC
USER nobody
