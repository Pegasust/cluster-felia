#!/usr/bin/env bash

# yq
BINARY=yq_linux_amd64
VERSION=v4.2.0
wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}.tar.gz -O - |\
  tar xz && mv ${BINARY} /usr/bin/yq