FROM ubuntu:14.04
#FROM centos:centos6

MAINTAINER shailen.werk@gmail.com

RUN sudo apt-get update
RUN sudo apt-get install build-essential libssl-dev

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get update
RUN sudo apt-get install nodejs

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
RUN source ~/.profile

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js
