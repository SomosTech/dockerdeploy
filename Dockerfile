FROM ubuntu:14.04

RUN apt-get update && apt-get install --yes curl
RUN curl https://install.meteor.com/ | sh
