ARG REGISTRY
FROM $REGISTRY/alpine:3.11 as build
RUN apk add --no-cache npm
ARG VERSION=1.8.0
ARG SHA512=47dc18dcb2ebcf2cd3320e79519f0a1809ae49c1bffb2089c169e7cfc58f331fc9511fdb1f7894f4605db4a5bf28680ec39b4430860bdd62a3a989d7e1cbdd38
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
FROM $REGISTRY/alpine:3.11
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
