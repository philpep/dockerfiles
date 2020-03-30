ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
	ejabberd \
	erlang-p1-pgsql \
	&& rm -rf /var/lib/apt/lists/*
RUN install -d -o ejabberd /run/ejabberd
COPY start.sh /
RUN chmod +x /start.sh
USER ejabberd
WORKDIR /var/lib/ejabberd
CMD ["/start.sh"]
