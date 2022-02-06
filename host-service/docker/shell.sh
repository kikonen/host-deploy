#!/usr/bin/env bash

DIR=`dirname $0`
DIR=`realpath $DIR`
ROOT_DIR=`dirname $DIR`
DOCKER_DIR=`realpath "$ROOT_DIR/../.."`
CONTAINER=host

$DOCKER_DIR/scripts/rails_shell.sh $CONTAINER "$@"
