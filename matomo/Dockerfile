ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.3.1.tar.gz
ARG SHA512=2f6f845e697c0492db47dfb6ce38383c37afd2c2ccab06d4188a1a8c5f584844690aa29f9691aa03b34b0e49464ef1f7de2a50f5a57ee2612f78899d68afcb47
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
USER nobody
