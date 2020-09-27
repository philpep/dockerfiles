ARG REGISTRY
FROM $REGISTRY/alpine:3.12 as build
RUN apk add --no-cache npm
ARG VERSION=1.8.6
ARG SHA512=5dff4acfc5a23752a7e0496fbfa3d263b40e76f67dba26e8c1a9cf8889ed302172e00e94710933b7b5b3f9580a675808d85d9da8a2b3aade08a03e2b7999a384
ARG DIST=$VERSION.tar.gz
ARG URL=https://github.com/ether/etherpad-lite/archive/$DIST
RUN adduser -h /usr/share/etherpad-lite -S -D etherpad-lite
WORKDIR /usr/share/etherpad-lite
USER etherpad-lite
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C . --strip-components=1 -xvzf $DIST && \
    rm -f $DIST
RUN mkdir -p src/node_modules
RUN ln -s /usr/share/etherpad-lite/src /usr/share/etherpad-lite/src/node_modules/ep_etherpad-lite
WORKDIR src
ENV NODE_ENV=production
RUN npm install
RUN npm audit fix

ARG REGISTRY
FROM $REGISTRY/alpine:3.12
RUN apk add --no-cache nodejs
RUN adduser -h /var/lib/etherpad-lite -S -D etherpad-lite
COPY --from=build /usr/share/etherpad-lite/src /usr/share/etherpad-lite/src
COPY --from=build /usr/share/etherpad-lite/settings.json.template /etc/etherpad-lite/settings.json
RUN ln -s /usr/share/etherpad-lite/src /usr/share/etherpad-lite/src/node_modules/ep_etherpad-lite
RUN ln -s /usr/share/etherpad-lite/src /usr/share/etherpad-lite/ep_etherpad-lite
RUN touch /usr/share/etherpad-lite/src/.ep_initialized
RUN sed -i 's@var/dirty.db@/var/lib/etherpad-lite/dirty.db@' /etc/etherpad-lite/settings.json
COPY start.sh /
WORKDIR /var/lib/etherpad-lite
USER etherpad-lite
ENV NODE_ENV=production
ENV DB_TYPE=postgres
CMD ["/start.sh"]
