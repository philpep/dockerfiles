ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache nginx
RUN sed -i '/user nginx;/d' /etc/nginx/nginx.conf
RUN sed -i 's/worker_processes auto;/worker_processes 1;/g' /etc/nginx/nginx.conf
RUN sed -i 's/80 default_server/8080 default_server/g' /etc/nginx/conf.d/default.conf
RUN install -d -o nginx /run/nginx
COPY proxy.conf /etc/nginx/conf.d/proxy.conf
COPY fastcgi_params /etc/nginx/fastcgi_params
COPY fastcgi.conf /etc/nginx/fastcgi.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80
STOPSIGNAL SIGTERM
USER nginx
WORKDIR /var/lib/nginx
CMD ["nginx", "-g", "daemon off;"]
