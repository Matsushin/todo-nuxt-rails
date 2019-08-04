FROM ruby:2.6.3-alpine3.10
ENV LANG C.UTF-8
RUN apk upgrade && \
    apk add --no-cache \
    bash \
    build-base \
    curl-dev \
    git \
    graphviz \
    imagemagick \
    imagemagick-dev \
    less \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mysql-dev \
    nodejs \
    openssl \
    readline \
    readline-dev \
    tar \
    ttf-freefont \
    tzdata \
    udev \
    wget \
    yaml \
    yaml-dev\
    zlib \
    zlib-dev

RUN gem install bundler
RUN gem update

ENV APP_HOME /todo-api
RUN mkdir $APP_HOME
RUN mkdir /var/log/api
WORKDIR $APP_HOME

ENV GEM_HOME=/bundle

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=$GEM_HOME

ADD . $APP_HOME
