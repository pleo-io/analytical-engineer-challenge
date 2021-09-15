#!/usr/bin/env sh

info_msg() {
    echo "========================================================================"
    echo "$(date +'%Y-%m-%dT%H:%M:%S%z') $@"
    echo "========================================================================"
}

cd $(dirname $0)

info_msg "building containers"
docker-compose build

./teardown.sh

info_msg "launching application"
docker-compose up
