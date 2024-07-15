server {
    listen ${LISTEN_PORT};

    server_name localhost;

    location / {
        root                    /usr/share/nginx/html;
    }

    location /api {
        uwsgi_pass              ${BACKEND_HOST}:${BACKEND_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location /admin {
        uwsgi_pass              ${BACKEND_HOST}:${BACKEND_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }
}