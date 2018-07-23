FROM r.philpep.org/alpine:3.8
RUN apk add --no-cache mercurial uwsgi uwsgi-python py2-pip && \
	pip install --no-cache hg-evolve==8.0.1 && \
	apk del py2-pip
COPY uwsgi.ini /etc/uwsgi/uwsgi.ini
COPY hgweb.wsgi /etc/mercurial/hgweb.wsgi
COPY hgweb.config /etc/mercurial/hgweb.config
COPY hgrc /etc/mercurial/hgrc
RUN mkdir /repos
USER uwsgi
EXPOSE 9000/tcp
CMD ["uwsgi", "-c", "/etc/uwsgi/uwsgi.ini"]
