FROM shelvak/ruby:2.1

MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y postgresql-server-dev-9.3

RUN mkdir -p /gps_tracker
RUN mkdir -p /bundle

WORKDIR /gps_tracker

EXPOSE 34567:34567

CMD bundle exec unicorn -c /gps_tracker/config/unicorn.rb -E production
