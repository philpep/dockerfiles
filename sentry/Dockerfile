ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
ARG SENTRY_VERSION=9.1.2
RUN apt-get -y update && apt-get -y install \
    python \
    libpython2.7 \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python get-pip.py && rm get-pip.py
ARG _BUILD_DEPS="gcc g++ libc6-dev python-dev"
RUN apt-get -y update && \
    apt-get -y install $_BUILD_DEPS && \
    pip install --no-cache-dir --disable-pip-version-check sentry==$SENTRY_VERSION && \
    apt-get -y purge $_BUILD_DEPS && \
    apt-get -y autoremove --purge && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --disable-pip-version-check 'sentry-auth-oidc<3'
ENV SENTRY_CONF=/etc/sentry
RUN sentry init $SENTRY_CONF
RUN useradd --home /var/lib/sentry --shell /bin/false sentry
USER sentry
WORKDIR /var/lib/sentry
CMD ["sentry", "run", "web"]
