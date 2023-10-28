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

clean:
	rm -rf .env.make