#!/bin/bash

docker-compose up -d
TASKNODE="$(docker ps | grep ws | grep tasknode | awk '{print $1}')"
docker exec -it $TASKNODE scripts/migrate_and_test.sh
docker-compose stop
docker-compose rm
