FROM lmac-debian-buildbox:latest

RUN echo "deb-src http://http.debian.net/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://http.debian.net/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update

RUN cd /root && apt-get build-dep -t wheezy-backports -y openvpn
RUN cd /root && apt-get source -t wheezy-backports -y openvpn

RUN apt-get install -y dialog
