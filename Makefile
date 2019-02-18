.ONESHELL:
SHELL := /bin/bash
NGINX_VERSION := 1.15

# using Docker Hub registry
repository_uri := jesugmz/portfolio
# it is evaluated when is used (recursively expanded variable)
# https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html#SEC59
image_tag_prod = prod-$(shell git describe --abbrev=0 --tags)

#
# Development targets
#
run: #pull-latest-dev-image
	@docker-compose -f docker/portfolio.yml up

destroy:
	@docker-compose -f docker/portfolio.yml down

restart: destroy run

bash:
	@docker-compose -f docker/portfolio.yml exec webserver bash

build-dev-image:
	docker build \
		--build-arg NGINX_VERSION=$(NGINX_VERSION) \
		--target dev \
		-f docker/webserver/Dockerfile \
		-t $(repository_uri):dev .

push-dev-image:
	docker push $(repository_uri):dev

pull-latest-dev-image:
	docker pull $(repository_uri):dev

#
# Production targets
#
build-prod-image:
	docker build \
		--build-arg NGINX_VERSION=$(NGINX_VERSION) \
		--target prod \
		-f docker/webserver/Dockerfile \
		-t $(repository_uri):$(image_tag_prod) .

push-prod-image:
	docker push $(repository_uri):$(image_tag_prod)

.DEFAULT_GOAL := run
