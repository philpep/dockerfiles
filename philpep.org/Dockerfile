FROM r.philpep.org/alpine:3.8 as builder
RUN apk add --no-cache py2-pip
RUN wget https://github.com/philpep/philpep.org/archive/master.zip && \
    unzip master.zip && \
    rm -f master.zip
WORKDIR philpep.org-master
RUN pip install -r requirements.txt
RUN hyde gen

FROM r.philpep.org/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /philpep.org-master/deploy /data
