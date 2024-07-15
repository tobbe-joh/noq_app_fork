#!/bin/sh

set -e

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
ln -s /vol/web/frontend /etc/nginx/conf.d/default.conf
