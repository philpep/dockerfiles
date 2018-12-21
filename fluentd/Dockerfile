FROM fluent/fluentd-kubernetes-daemonset:v1.3-debian-elasticsearch
RUN apt-get -y update && apt-get -y upgrade
COPY extra.conf /tmp/
RUN cat /tmp/extra.conf >> /fluentd/etc/kubernetes.conf
