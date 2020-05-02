ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
	wget \
	gnupg2 \
	ca-certificates \
	gunicorn3 \
	python3-pygments \
	python3-eventlet \
	&& rm -rf /var/lib/apt/apt/lists/*
RUN wget https://apt.philpep.org/key.asc -O - | apt-key --keyring /etc/apt/trusted.gpg.d/philpep.gpg add -
RUN echo "deb http://apt.philpep.org buster-backports main" > /etc/apt/sources.list.d/philpep.list
RUN apt-get update && apt-get -y install --no-install-recommends -t buster-backports \
	mercurial \
	mercurial-evolve \
	&& rm -rf /var/lib/apt/apt/lists/*
COPY hgweb.py hgweb.config gunicorn.conf /etc/mercurial/
RUN mkdir /repos
RUN useradd --home /var/lib/hgweb --shell /bin/bash hgweb
WORKDIR /etc/mercurial
USER hgweb
EXPOSE 9000/tcp
CMD ["gunicorn3", "--config", "/etc/mercurial/gunicorn.conf", "hgweb:application"]
