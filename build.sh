#!/bin/sh

export EVENT_TYPE=$1 COMMIT_HASH=$2 HTTP_URL=$3 SSH_URL=$4

BUILD_DIR=$(mktemp -d)
trap '"rm -rf $BUILD_DIR"' EXIT

git clone --depth 1 ${HTTP_URL}

# build image

# deploy to k8s
