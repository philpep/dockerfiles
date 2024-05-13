ARG REGISTRY
FROM $REGISTRY/debian:bookworm-slim as build
RUN apt-get update && apt-get install -y --no-install-recommends \
    zip \
    && rm -rf /var/lib/apt/lists/*
COPY scripts /tmp/scripts
RUN cd /tmp/scripts && zip -r /tmp/scripts.jar .

FROM quay.io/keycloak/keycloak:24.0
USER root
COPY --from=build /tmp/scripts.jar /opt/keycloak/providers/scripts.jar
COPY themes/philpep /opt/keycloak/themes/philpep
RUN /opt/keycloak/bin/kc.sh build
USER keycloak
ENV KC_PROXY=edge
CMD ["start", "--hostname-strict=false"]
