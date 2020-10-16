ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
    wget \
    gnupg2 \
    ca-certificates \
    gunicorn3 \
    python3-pygments \
    python3-eventlet \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O - https://apt.philpep.org/key.asc | apt-key --keyring /etc/apt/trusted.gpg.d/philpep.gpg add -
RUN echo "deb http://apt.philpep.org buster-backports main" > /etc/apt/sources.list.d/philpep.list
RUN apt-get update && apt-get -y -t buster-backports install --no-install-recommends \
    mercurial \
    mercurial-evolve \
    && rm -rf /var/lib/apt/lists/*
COPY hgweb.py hgweb.config gunicorn.conf /etc/mercurial/
RUN useradd --create-home --home /var/lib/hg --shell /usr/bin/hg-ssh --uid 1000 hg
ENV PYTHONPATH=/etc/mercurial
USER hg
EXPOSE 9000/tcp
CMD ["gunicorn3", "--config", "/etc/mercurial/gunicorn.conf", "hgweb:application"]
