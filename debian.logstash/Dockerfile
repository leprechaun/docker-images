FROM debian:latest

RUN curl -o - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install openjdk-7-headless logstash logstash-contrib
