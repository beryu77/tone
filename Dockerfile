FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /tone

WORKDIR /tone

ADD Gemfile /tone/Gemfile
ADD Gemfile.lock /tone/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /tone