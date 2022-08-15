FROM quay.io/keycloak/keycloak:19.0
USER root
RUN microdnf -y update
RUN microdnf -y install zip
COPY scripts /tmp/scripts
RUN cd /tmp/scripts && zip -r /opt/keycloak/providers/scripts.jar .
RUN /opt/keycloak/bin/kc.sh build
COPY themes/philpep /opt/keycloak/themes/philpep
USER keycloak
ENV KC_PROXY=edge
CMD ["start", "--hostname-strict=false"]
