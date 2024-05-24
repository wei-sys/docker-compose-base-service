FROM nginx:alpine
# try to slove container created file own is root

# RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#install nginx
ENV UID=1000

# RUN apt-get update && apt-get upgrade -y \
#     && apt install nano curl -y \ 
#     && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/cache/nginx/client_temp && \
        mkdir -p /var/cache/nginx/proxy_temp && \
        mkdir -p /var/cache/nginx/fastcgi_temp && \
        mkdir -p /var/cache/nginx/uwsgi_temp && \
        mkdir -p /var/cache/nginx/scgi_temp && \
        chown -R $UID:$UID /var/cache/nginx && \
        chown -R $UID:$UID /etc/nginx/ && \
        chmod -R 755 /etc/nginx/ && \
        chown -R $UID:$UID /var/log/nginx

RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R $UID:$UID /etc/nginx/ssl/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN touch /var/run/nginx.pid && \
        chown -R $UID:$UID /var/run/nginx.pid /run/nginx.pid

USER $UID

CMD ["nginx", "-g", "daemon off;"]