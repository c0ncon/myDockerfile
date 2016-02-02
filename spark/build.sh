#!/bin/sh

docker build -t spark_master --file=Dockerfile_master .
docker build -t spark_worker --file=Dockerfile_worker .

