ARG REGISTRY
FROM $REGISTRY/nginx
USER root
RUN apk add --no-cache nginx-mod-http-fancyindex
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER nginx
