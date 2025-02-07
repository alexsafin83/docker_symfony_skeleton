#!/bin/sh

docker compose -f ./docker/composer/docker-compose.yaml run --rm -it composer "$@"
