server {
    listen ${LISTEN_PORT} default_server;
    listen [::]:80 default_server;

    server_name frontend_server;

    location /static {
        alias /vol/static;
    }

    location / {
        include         /etc/nginx/uwsgi_params;
        uwsgi_pass      ${FRONTEND_HOST}:${FRONTEND_PORT};
        uwsgi_param     Host                    $http_host;
        uwsgi_param     HTTP_X-Forwarded-For    $proxy_add_x_forwarded_for;
        uwsgi_param     HTTP_X-Forwarded-Proto  https;
        uwsgi_param     HTTP_X-Connected-User   'someUser';

        uwsgi_read_timeout 300s;
        uwsgi_connect_timeout 300s;
    }

    location /api {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location /admin {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }
}