#!/usr/bin/env bash

# Change this folder to your project working directory
# this file is mounted to your Docker image whenever you
# spin up the container

# On Unix: CHANGE THIS LINE to your project directory
#  example:
#  work=/Users/tommytrojan/cs353/lab1data
work=~/Downloads/cs353-docker

img_name=cs353_docker

docker_compose="./docker-compose.yml"

# Check if mounting directory is set
if [[ -z "${work}" ]]; then
    work=""
    echo -e "No work directory set!\nMake sure to set at the top of the run.sh script, please!"
    exit 1
fi

# Check if mount directory can be found
if [[ ! -d "${work}" ]]; then
    echo -e "The work directory cannot be found!\nMake sure you set this at the top of the run.sh script, please!"
    exit 1
else
    export work=$work
fi


function docker_up() {
    # Create docker image
    built=$( docker image ls | grep -c "${img_name}")

    if [[ $built ]]; then
        echo "Running Docker image"
    else
        echo "Building Docker image"
    fi

    docker-compose -f "${docker_compose}" up -d || exit $?

    echo "Done!"
}


function docker_down() {
    # stop running docker image
    docker-compose -f "${docker_compose}" down
}

function docker_shell() {
    # check if a container is running
    container=$(docker ps | grep -c "${img_name}")
    if [[ $container == 0 ]]; then
        echo "No container running. Please run first!"
        exit 1;
    fi
    docker exec -it "${img_name}" /bin/tcsh
}

if [[ $1 = "start" ]]; then
docker_up
exit $?
elif [[ $1 = "stop" ]]; then
docker_down
elif [[ $1 = "shell" ]]; then
docker_shell
else
    echo this script manages the linux container
    echo   start - run the docker container
    echo   shell - start a shell to run commands in xv6
    echo   stop  - kill the linux container
    exit 1
fi
