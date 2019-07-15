FROM node:10.15-alpine

ENV APP_HOME /todo
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk update && \
    apk add git && \
    npm install -g npm && \
    npm install -g vue-cli

COPY package.json $APP_HOME/
RUN npm install
