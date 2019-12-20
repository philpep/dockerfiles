ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache python3 py3-setuptools py3-pip python3-dev g++ && \
    python3 -m pip install --disable-pip-version-check --no-cache-dir gunicorn eventlet pygments 'mercurial>=5.2' 'hg-evolve>=9.2.1' && \
	apk del py3-pip python3-dev g++
COPY hgweb.py hgweb.config gunicorn.conf /etc/mercurial/
RUN mkdir /repos
RUN addgroup -g 101 -S hgweb
RUN adduser -h /var/lib/hgweb -S -D -H -u 100 -G hgweb hgweb
RUN install -o hgweb -g hgweb -d /var/run/hgweb
WORKDIR /etc/mercurial
USER hgweb
EXPOSE 9000/tcp
CMD ["gunicorn", "--config", "/etc/mercurial/gunicorn.conf", "hgweb:application"]
