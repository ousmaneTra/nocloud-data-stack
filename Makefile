.env:
	touch .env

.env.make: .env
	sed '/^#/!s/^[[:space:]]*[^[:space:]#]/export &/' $< > $@

include .env.make

DOCKER_COMPOSE_CMD := docker compose -f compose.yaml -f volumes-$(STACK_ENV).yaml

.PHONY: start
start: images
	$(DOCKER_COMPOSE_CMD) up -d

.PHONY: stop
stop:
	$(DOCKER_COMPOSE_CMD) down

.PHONY: images
images:
	./superset-build-image.sh

.PHONY: deploy
verify:
	$(DOCKER_COMPOSE_CMD) config > final_compose.yaml

.PHONY: nginx_start
nginx_start:
	docker compose -f nginx-compose.yaml up --force-recreate -d

.PHONY: nginx_stop
nginx_stop:
	docker compose -f nginx-compose.yaml down

.PHONY: nginx_init
nginx_init: nginx_stop
	./init-letsencrypt.sh
	docker compose -f nginx-compose.yaml up --force-recreate -d

clean:
	rm -rf .env.make