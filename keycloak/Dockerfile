FROM quay.io/keycloak/keycloak:16.1.1
USER root
RUN microdnf -y update
RUN microdnf -y install zip
COPY scripts /tmp/scripts
RUN cd /tmp/scripts && zip -r /opt/jboss/keycloak/standalone/deployments/scripts.jar .
COPY themes/philpep /opt/jboss/keycloak/themes/philpep
USER jboss
