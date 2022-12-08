#!/bin/bash

# shellcheck disable=SC2086
set -eux;

cd "$(dirname $0)";

# PHP 7.4
docker pull php:7.4-apache-buster
docker build --progress plain -f ./Dockerfile-7.4 -t redbitcz/wkpdf:0.12.6-7.4 .
docker tag redbitcz/wkpdf:0.12.6-7.4 redbitcz/wkpdf:7.4

docker build --progress plain -f ./Dockerfile-7.4-debug -t redbitcz/wkpdf:0.12.6-7.4-debug .
docker tag redbitcz/wkpdf:0.12.6-7.4-debug redbitcz/wkpdf:7.4-debug

# PHP 8.0
docker pull php:8.0-apache-buster
docker build --progress plain -f ./Dockerfile-8.0 -t redbitcz/wkpdf:0.12.6-8.0 .
docker tag redbitcz/wkpdf:0.12.6-8.0 redbitcz/wkpdf:8.0

docker build --progress plain -f ./Dockerfile-8.0-debug -t redbitcz/wkpdf:0.12.6-8.0-debug .
docker tag redbitcz/wkpdf:0.12.6-8.0-debug redbitcz/wkpdf:8.0-debug

# PHP 8.1
docker pull php:8.1-apache-buster
docker build --progress plain -f ./Dockerfile-8.1 -t redbitcz/wkpdf:0.12.6-8.1 .
docker tag redbitcz/wkpdf:0.12.6-8.1 redbitcz/wkpdf:8.1

docker build --progress plain -f ./Dockerfile-8.1-debug -t redbitcz/wkpdf:0.12.6-8.1-debug .
docker tag redbitcz/wkpdf:0.12.6-8.1-debug redbitcz/wkpdf:8.1-debug

# PHP 8.2
docker pull php:8.2-apache-buster
docker build --progress plain -f ./Dockerfile-8.2 -t redbitcz/wkpdf:0.12.6-8.2 .
docker tag redbitcz/wkpdf:0.12.6-8.2 redbitcz/wkpdf:8.2
docker tag redbitcz/wkpdf:0.12.6-8.2 redbitcz/wkpdf:0.12.6
docker tag redbitcz/wkpdf:0.12.6-8.2 redbitcz/wkpdf:latest

docker build --progress plain -f ./Dockerfile-8.2-debug -t redbitcz/wkpdf:0.12.6-8.2-debug .
docker tag redbitcz/wkpdf:0.12.6-8.2-debug redbitcz/wkpdf:8.2-debug
docker tag redbitcz/wkpdf:0.12.6-8.2-debug redbitcz/wkpdf:0.12.6-debug
docker tag redbitcz/wkpdf:0.12.6-8.2-debug redbitcz/wkpdf:debug

if [ "${PUSH:-0}" = "1" ]; then
    docker push redbitcz/wkpdf:0.12.6-7.4
    docker push redbitcz/wkpdf:7.4
    docker push redbitcz/wkpdf:7.4-debug
    docker push redbitcz/wkpdf:0.12.6-8.0
    docker push redbitcz/wkpdf:8.0
    docker push redbitcz/wkpdf:8.0-debug
    docker push redbitcz/wkpdf:0.12.6-8.1
    docker push redbitcz/wkpdf:8.1
    docker push redbitcz/wkpdf:8.1-debug
    docker push redbitcz/wkpdf:0.12.6-8.2
    docker push redbitcz/wkpdf:8.2
    docker push redbitcz/wkpdf:0.12.6
    docker push redbitcz/wkpdf:latest
    docker push redbitcz/wkpdf:8.2-debug
    docker push redbitcz/wkpdf:0.12.6-debug
    docker push redbitcz/wkpdf:debug
fi
