ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    python3-pip \
    python3-yaml \
    && rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --disable-pip-version-check --no-cache-dir kubernetes raven
ADD https://raw.githubusercontent.com/getsentry/sentry-kubernetes/521b5129/sentry-kubernetes.py /usr/local/bin/
RUN chmod a+r /usr/local/bin/sentry-kubernetes.py
RUN useradd --home /var/lib/sentry --shell /bin/bash sentry
WORKDIR /var/lib/sentry
USER sentry
CMD ["python3", "/usr/local/bin/sentry-kubernetes.py"]
