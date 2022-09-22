ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    unzip \
    python3-pip \
    python3-psycopg2 \
    python3-ldap \
    libmagic1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --system --shell /usr/sbin/nologin --home-dir /var/lib/funkwhale --create-home funkwhale
WORKDIR /var/lib/funkwhale
USER funkwhale
RUN mkdir -p config api data/static data/media data/music front
ARG VERSION=1.2.8
ARG SRC=api-$VERSION.zip
ARG URL=https://dev.funkwhale.audio/funkwhale/funkwhale/-/jobs/artifacts/$VERSION/download?job=build_api
ARG SHA512=65b4dd39d4d40193cca86a3c7b6714360df36794071e349f356692b5c2af3865fdeae5f8a7e8ca8623325ea8445e9879b8c620a348169cc448991fb01e4636c6
RUN wget -O $SRC $URL && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    unzip $SRC -d extracted && \
    mv extracted/api/* api/ && \
    rm -rf $SRC extracted
ARG SRC=front-$VERSION.zip
ARG URL=https://dev.funkwhale.audio/funkwhale/funkwhale/-/jobs/artifacts/$VERSION/download?job=build_front
ARG SHA512=b338fb5e33aae89c74198c2754a3116fa78af771072affd41caabe72e8a1b144da961158194be17d327b8aeadd5583d696dc208a57a96df699978f4f8259e5a9
RUN wget -O $SRC $URL && \
    echo "expected SHA512=$(sha512sum $SRC)" && \
    echo "$SHA512  $SRC" | sha512sum -c - && \
    unzip $SRC -d extracted && \
    mv extracted/front . && \
    rm -rf $SRC extracted
RUN sed -i '/^psycopg2.*/d' api/requirements/base.txt
RUN sed -i '/^python-ldap.*/d' api/requirements/base.txt
USER root
RUN python3 -m pip install --no-cache -r api/requirements.txt
USER funkwhale
WORKDIR /var/lib/funkwhale/api
# Reference: https://dev.funkwhale.audio/funkwhale/funkwhale/raw/stable/deploy/env.prod.sample
ENV FUNKWHALE_URL=http://localhost:8080 \
    FUNKWHALE_WEB_WORKERS=2 \
    DATABASE_URL=postgresql://funkwhale@:5432/funkwhale \
    DJANGO_SECRET_KEY=CHANGEME
RUN python3 manage.py collectstatic
CMD gunicorn config.asgi:application -w $FUNKWHALE_WEB_WORKERS -k uvicorn.workers.UvicornWorker -b 0.0.0.0:8080
