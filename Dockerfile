FROM ruby:2.2

ENV LANG C.UTF-8

# 基本パッケージのインストール
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      gnupg \
      libpq-dev \
      curl \
      file \
      vim \
      less \
      poppler-utils

RUN curl -sL https://deb.nodesource.com/setup_0.10 | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g

WORKDIR /api
RUN gem install bundler:1.6.1

COPY Gemfile  .
COPY Gemfile.lock .
RUN bundle install

COPY . .
