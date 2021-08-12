ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    burp \
    && rm -rf /var/lib/apt/lists/*
CMD ["burp", "-F", "-c", "/etc/burp/burp-server.conf"]
