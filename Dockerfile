ARG RUBY_VERSION=3.3.4
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

RUN apt-get update -qq

WORKDIR /acme
RUN gem install minitest

COPY . /acme

CMD ["bash"]
