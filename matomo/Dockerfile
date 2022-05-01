ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG SRC=piwik-4.9.1.tar.gz
ARG SHA512=298ec2bc10ea48a38fd24fb3ca1c34cc82208f35d38947212c9b14d780f3ccb9f7ec45f8e7f5c9dc534f0ed0c9daa19ceee6e310ef197b5bd64b65a6b7ae856b
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
