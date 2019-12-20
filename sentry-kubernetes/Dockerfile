ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache py3-pip py3-yaml
RUN pip3 install --disable-pip-version-check --no-cache-dir kubernetes raven
ADD https://raw.githubusercontent.com/getsentry/sentry-kubernetes/74a7eb9d84c0405f3b07f9838a9674ace669e755/sentry-kubernetes.py /usr/local/bin/
RUN chmod a+r /usr/local/bin/sentry-kubernetes.py
RUN adduser -h /var/lib/sentry -S -D sentry
WORKDIR /var/lib/sentry
USER sentry
CMD ["python3", "/usr/local/bin/sentry-kubernetes.py"]
