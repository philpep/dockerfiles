ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.11.0.tar.gz
ARG SHA512=f2dfba20b9aa01dd8ce089e1faaceb83a4bf749d552c520f6033235f55130390e6bfeb80f7eaff9f2a9dd9a61c84d22de3cd4001b5041a47a908fa543364ef50
USER root
RUN mkdir -p /data/matomo
RUN wget -O $SRC https://builds.matomo.org/$SRC && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    tar -C /data/matomo -xvzf $SRC && \
    chown -R nobody:nogroup /data/matomo && \
    rm -f $SRC
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER nobody
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize", "--force-stderr"]
