ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=v0.10.3
ARG SRC=shaarli-$VERSION-full.tar.gz
ARG SHA512=5bffffa8a13a46d0b72c49ac24e4e3452e7699e4586b364de1f0454c6011b3ff832b1b1e0a3d84265ad5e818714fe22c455f9a607a64e5c5ee51244ebc77aaaf
USER root
RUN wget -O $SRC https://github.com/shaarli/Shaarli/releases/download/$VERSION/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data -xvzf $SRC && \
    rm -f $SRC
USER nobody
