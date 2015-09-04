# dockerdeploy

Deploy Meteor applications with Meteor running in a Docker container. To deploy a Meteor application, follow the following steps:

### Installation

1. Install Docker and docker-machine on your computer using the [Docker toolbox](https://docs.docker.com/mac/step_one/). Only install the programs; do not launch the Docker Quickstart terminal.
2. Open a terminal and create a docker-machine named `dev` by running `docker-machine create --driver virtualbox dev`.
3. Clone dockerdeploy (this repo).

### Running

1. Setup your environment to use this docker-machine by running `eval "$(docker-machine env dev)"` . You will need to do this every time you open a new terminal window.
2. Run dockerdeploy by running `DEPLOY_HOSTNAME=galaxy.meteor.com <path-to-dockerdeploy>/deploy.sh --settings <settings-file.json> <hostname>`. The --settings flag is optional.

### Notes

If you already have installed Docker and docker-machine, you can start docker by running `docker-machine start dev`. You will also need to do this if you reboot your machine or docker dies for some random reason (this happens).
