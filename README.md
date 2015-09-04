# dockerdeploy

Deploy Meteor applications with Meteor running in a Docker container. To deploy a Meteor application, follow the following steps:

1. Install Docker and docker-machine on your computer using the [Docker toolbox](https://docs.docker.com/mac/step_one/). Only install the programs; do not launch the Docker Quickstart terminal.
2. Open a terminal and create a docker-machine named `dev` by running `docker-machine create --driver virtualbox dev`.
3. Setup your environment to use this docker-machine by running `eval "$(docker-machine env dev)"`
4. Run dockerdeploy by running `DEPLOY_HOSTNAME=galaxy.meteor.com <path-to-docker>/deploy.sh <hostname>`. You can optionally pass a settings file by passing a `--settings <settings-file.json>` flag.

If you already have installed Docker and docker-machine, you can replace steps 1 and 2 by running just `docker-machine start dev`.
