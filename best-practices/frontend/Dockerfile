FROM nginx:mainline-alpine3.20-slim 

RUN rm -rf /etc/nginx/nginx.conf && \
    rm -rf /etc/nginx/conf.d && \
    # copy  below commands from Running  nginx officail image  with non root user. https://forums.docker.com/t/running-nginx-official-image-as-non-root/135759/7
    mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx/ && \
    chmod -R 755 /etc/nginx/ && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid
COPY code /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
USER nginx