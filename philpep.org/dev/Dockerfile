ARG REGISTRY
FROM $REGISTRY/alpine:3.10 as builder
RUN apk add --no-cache py2-pip
RUN wget https://github.com/philpep/philpep.org/archive/dev.zip && \
    unzip dev.zip && \
    rm -f dev.zip
WORKDIR philpep.org-dev
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt
RUN hyde gen

ARG REGISTRY
FROM $REGISTRY/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /philpep.org-dev/deploy /data
