FROM ruby:2.6.5

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y default-mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Docker内部でのアプリの位置と名称
RUN mkdir /tone 
WORKDIR /tone

# Docker内部でのGemfile、Gemfile.lockの位置
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . /tone

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids