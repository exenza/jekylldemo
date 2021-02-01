FROM ruby:2.6
LABEL maintainers="https://github.com/exenza"

ENV RUBY_VERSION=2.6
ENV JEKYLL_VERSION=3.8.5
ENV AWSCLI_VERSION=2

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl unzip python3-pip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN gem install bundler jekyll
