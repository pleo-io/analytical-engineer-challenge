#!/usr/bin/env sh

info_msg() {
    echo "========================================================================"
    echo "$(date +'%Y-%m-%dT%H:%M:%S%z') $@"
    echo "========================================================================"
}

cd $(dirname $0)
#export PATH=$PATH:/usr/local/go/bin
#export PATH=$PATH:/usr/local/bin/kotlinc/bin

info_msg "execute starting"

echo "hello world"
python --version

info_msg "creating schema"
psql -h dwh -U dwh -f create.sql

info_msg "reporting results"
psql -h dwh -U dwh -f report.sql

info_msg "execute stopping"
