#!/bin/bash
set -e

cd $(dirname $0)

images=('alpine' 'debian')

if [ "$(docker version --format '{{.Server.Experimental}}')" = 'true' ]; then
    export DOCKER_BUILDKIT=1
fi


for image in "${images[@]}"; do
    tag="jd2dev:${image}"
    
    echo "Building $tag"
    docker build -t $tag -f $image.Dockerfile .

    echo "Testing image"
    GOSS_FILES_PATH=./tests/default dgoss run $tag

    echo "Testing again with UID and GID"
    GOSS_FILES_PATH=./tests/uid-test dgoss run -e UID=1001 -e GID=101 $tag
done


