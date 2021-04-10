ARG REGISTRY
FROM $REGISTRY/nginx
USER root
RUN apt-get update && apt-get install -y \
    nginx-full \
    && rm -rf /var/lib/apt/lists/*
USER www-data
