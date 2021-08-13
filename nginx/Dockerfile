ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get install -y \
    nginx-light \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i '/user www-data;/d' /etc/nginx/nginx.conf
RUN sed -i 's@pid .*@pid /dev/null;@g' /etc/nginx/nginx.conf
RUN sed -i 's/worker_processes auto;/worker_processes 1;/g' /etc/nginx/nginx.conf
RUN install -d -o www-data \
    /var/lib/nginx/body \
    /var/lib/nginx/fastcgi \
    /var/lib/nginx/uwsgi \
    /var/lib/nginx/scgi \
    /var/lib/nginx/proxy
RUN rm -rf /var/www/*
COPY default.conf /etc/nginx/sites-available/default
COPY proxy.conf /etc/nginx/conf.d/
COPY fastcgi_params /etc/nginx/fastcgi_params
COPY fastcgi.conf /etc/nginx/fastcgi.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 8080
STOPSIGNAL SIGTERM
USER www-data
WORKDIR /var/lib/nginx
CMD ["nginx", "-g", "daemon off;"]
