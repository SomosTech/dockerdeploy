#!/bin/bash

function abspath() { 
    pushd . > /dev/null 
    if [ -d "$1" ] 
    then
        cd "$1" 
        dirs -l +0 
    else 
        cd "`dirname \"$1\"`" 
        cur_dir=`dirs -l +0` 
        if [ "$cur_dir" == "/" ] 
        then 
            echo "$cur_dir`basename \"$1\"`"
        else
            echo "$cur_dir/`basename \"$1\"`" 
        fi 
    fi 
    popd > /dev/null
}

set -e

DOCKER_IMAGE=dockerdeploy

echo "Building Docker image..."
docker build -t $DOCKER_IMAGE "$(dirname $0)"

APP_LOCATION="$(pwd)"

while [[ $# > 1 ]]
do
    FLAG="$1"
    shift

    case $FLAG in
        --settings)
        SETTINGS="$(abspath $1)"
        HAS_SETTINGS="1"
        shift
        ;;
        *)
        echo "Unknown option \"$FLAG\""
        exit 1
        ;;
    esac
done

APP_HOSTNAME="$1"

echo "Running meteor in Docker container..."

if [ "$HAS_SETTINGS" == "1" ]
then
    docker run -i -t --rm \
        -v "$APP_LOCATION":/app \
        -v "$HOME/.meteorsession":/root/.meteorsession \
        -v "$SETTINGS":/settings.json \
        -e DEPLOY_HOSTNAME="$DEPLOY_HOSTNAME" \
        $DOCKER_IMAGE /bin/sh -c "cd /app && meteor deploy --settings /settings.json $APP_HOSTNAME"
else
    docker run -i -t --rm \
        -v "$APP_LOCATION":/app \
        -v "$HOME/.meteorsession":/root/.meteorsession \
        -e DEPLOY_HOSTNAME="$DEPLOY_HOSTNAME" \
        $DOCKER_IMAGE /bin/sh -c "cd /app && meteor deploy $APP_HOSTNAME"
fi
