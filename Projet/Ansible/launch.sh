#!/bin/sh

docker build -t ansible-container .

docker run --rm -it \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${HOME}/.aws:/root/.aws \
  -v ${PWD}:/workspace \
  ansible-container