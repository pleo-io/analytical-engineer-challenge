#!/usr/bin/env sh

info_msg() {
    echo "========================================================================"
    echo "$(date +'%Y-%m-%dT%H:%M:%S%z') $@"
    echo "========================================================================"
}

cd $(dirname $0)

### Stop docker and remove any existing volumes
info_msg "cleaning up previous runs"
docker-compose down
docker-compose rm -f -v
docker volume rm $(docker volume ls | grep analytical-engineer-challenge | awk '{print $2}')