ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache uwsgi uwsgi-python py2-pip && \
    apk add --no-cache mercurial --repository http://dl-cdn.alpinelinux.org/alpine/edge/main && \
	pip install --no-cache-dir --disable-pip-version-check hg-evolve==8.3.3 && \
	apk del py2-pip
COPY uwsgi.ini /etc/uwsgi/uwsgi.ini
COPY hgweb.wsgi /etc/mercurial/hgweb.wsgi
COPY hgweb.config /etc/mercurial/hgweb.config
COPY hgrc /etc/mercurial/hgrc
RUN mkdir /repos
USER uwsgi
EXPOSE 9000/tcp
CMD ["uwsgi", "-c", "/etc/uwsgi/uwsgi.ini"]
