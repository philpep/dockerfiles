ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install \
    gunicorn3 \
    python3-pygments \
    python3-eventlet \
    && apt-get -y -t buster-backports install \
    mercurial \
    mercurial-evolve \
    && rm -rf /var/lib/apt/lists/*
COPY hgweb.py hgweb.config gunicorn.conf /etc/mercurial/
RUN useradd --create-home --home /var/lib/hg --shell /usr/bin/hg-ssh --uid 1000 hg
ENV PYTHONPATH=/etc/mercurial
USER hg
EXPOSE 9000/tcp
CMD ["gunicorn3", "--config", "/etc/mercurial/gunicorn.conf", "hgweb:application"]
