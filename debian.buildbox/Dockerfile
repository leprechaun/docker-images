FROM lmac-debian-base:latest

RUN echo "deb-src http://http.debian.net/debian wheezy main" >> /etc/apt/sources.list
RUN echo "deb-src http://http.debian.net/debian wheezy-updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org wheezy/updates main" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y build-essential
RUN apt-get install -y dpkg-dev
RUN apt-get install --no-install-recommends -y fakeroot devscripts
