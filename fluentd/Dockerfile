FROM fluent/fluentd-kubernetes-daemonset:v1.3-debian-elasticsearch
RUN apt-get -y update && apt-get -y upgrade
RUN mkdir -p /fluentd/etc/conf.d
COPY local.conf /fluentd/etc/conf.d/
