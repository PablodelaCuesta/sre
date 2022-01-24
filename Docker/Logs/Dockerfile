FROM fluent/fluentd:v1.14-debian-1

USER root

RUN apt-get update && apt-get install make libcurl4-gnutls-dev -y \
    build-essential
RUN gem install fluent-plugin-mongo
RUN gem install fluent-plugin-elasticsearch