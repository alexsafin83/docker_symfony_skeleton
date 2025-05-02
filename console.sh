#!/bin/sh

. ./shellStyle

echo "running command:"
echo -e "${BoldIntensityGreen}php bin/console $* ${Neutral}"

docker compose -f ./docker/docker-compose.dev.yaml run --rm -it phpdev php bin/console "$@"
