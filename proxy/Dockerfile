FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="info@noq.nu"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=backend
ENV APP_PORT=9000
ENV FRONTEND_HOST=frontend
ENV FRONTEND_PORT=3000
ENV HTTP_UPGRADE=$http_upgrade
ENV HOST=$host
ENV REMOTE_ADDR=$remote_addr
ENV PROXY_ADD=$proxy_add_x_forwarded_for
ENV SCHEMA=$scheme

USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /vol/static

USER nginx

CMD ["/run.sh"]
