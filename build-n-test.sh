#!/bin/sh
set -e

images=('alpine' 'debian')

if [ "$(docker version --format '{{.Server.Experimental}}')" = 'true' ]; then
    export DOCKER_BUILDKIT=1
fi


for image in "${images[@]}"; do
    tag="jd2dev:${image}"
    
    echo "Building $tag"
    docker build -t $tag -f $image.Dockerfile .

    echo "Testing image"
    dgoss run $tag
done


