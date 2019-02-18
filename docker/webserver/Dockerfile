ARG NGINX_VERSION=1.15

FROM nginx:$NGINX_VERSION AS base

RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www

#
# development stage
#
FROM base AS dev

# do nothing extra for this stage

#
# production stage
#
FROM base AS prod

COPY docker/webserver/conf/nginx.conf /etc/nginx/nginx.conf
COPY docker/webserver/conf/server-block.conf /etc/nginx/conf.d/jesusgomez.io.conf
COPY --chown=nginx:nginx src/ ./
