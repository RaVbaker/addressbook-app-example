#!/bin/bash

set -e

docker ps | grep address | cut -d" " -f1|xargs docker stop
docker build -t addressbook-pgsql - < docker-containers/Dockerfile.postsgresql.9.4
docker run -d -p 54321:5432 addressbook-pgsql
