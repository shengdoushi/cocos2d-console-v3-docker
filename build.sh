#!/usr/bin/env bash


set -e

TIME=`date "+%Y%m%d%H%M"`
GIT_VERSION=`git log -1 --pretty=format:"%h"`
REGISTRY_NAME=cocos2dx-console-v3
IMAGE_NAME=${REGISTRY_NAME}:v${TIME}_${GIT_VERSION}
IMAGE_NAME_LATEST=${REGISTRY_NAME}:latest

echo "$(uname) - $(uname -m)"
if [ "$(uname -m)" = "arm64" ] ;then
  docker buildx build --load --platform=linux/amd64 -t ${IMAGE_NAME_LATEST} .
else
  docker build -t ${IMAGE_NAME_LATEST} .
fi
