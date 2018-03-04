FROM ubuntu:latest

RUN mkdir -p /var/work

WORKDIR /var/work
ADD . /var/work

RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install python -y
RUN curl https://sdk.cloud.google.com | bash

ENTRYPOINT ["tail", "-f", "/dev/null"]
