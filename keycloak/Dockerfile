FROM jboss/keycloak:11.0.2
USER root
RUN microdnf -y update
RUN microdnf -y install zip
COPY scripts /tmp/scripts
RUN cd /tmp/scripts && zip -r /opt/jboss/keycloak/standalone/deployments/scripts.jar .
USER jboss
