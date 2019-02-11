ARG REGISTRY
FROM $REGISTRY/alpine:3.9
RUN apk add --no-cache uwsgi uwsgi-python && \
    apk add --no-cache mercurial --repository http://dl-cdn.alpinelinux.org/alpine/edge/main
COPY uwsgi.ini /etc/uwsgi/uwsgi.ini
COPY hgweb.wsgi /etc/mercurial/hgweb.wsgi
COPY hgweb.config /etc/mercurial/hgweb.config
RUN mkdir /repos
USER uwsgi
EXPOSE 9000/tcp
CMD ["uwsgi", "-c", "/etc/uwsgi/uwsgi.ini"]
