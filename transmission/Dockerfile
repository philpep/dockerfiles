ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    transmission-daemon \
    && rm -rf /var/lib/apt/lists/*
USER debian-transmission
WORKDIR /var/lib/transmission-daemon
CMD ["transmission-daemon", "--foreground"]
