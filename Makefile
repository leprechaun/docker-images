# targets=$(for dir in `find . -type d`; do f="${dir/\.\//}"; echo ${f//\./-}; done; )
# $(shell for dir in `find . -type d`; do echo $$dir | sed "s/\./-/g" | sed "s/-\///g"; done; )


targets=make -qp | grep -P '^[.a-zA-Z0-9][^$#\/\t=]*:([^=]|$)' | tee >(cut -d: -f1 ) >(grep '^\s*\.PHONY\s*:' |cut -d: -f2) >/dev/null | tr ' ' '\n' | sed '/^\s*\./ d; /^\s*$/ d' |sort |uniq -u

#targets:
#	echo $(shell for dir in `find . -type d`; do f=$dir; echo $f; f="${dir/\.\//}"; echo ${f//\./-}; done; )

all: $(shell for dir in `find . -type d`; do echo $$dir | sed "s/\./-/g" | sed "s/-\///g"; done; )

-:
	@echo "Empty task"


all: ${targets}

base: debian-base ubuntu-base

non-base: debian-buildbox ubuntu-buildbox

debian-base:
	docker build -t lmac-debian-base:latest debian.base/

debian-buildbox:
	docker build -t lmac-debian-buildbox:latest debian.buildbox/

debian-buildbox-openvpn:
	docker build -t lmac-debian-buildbox-openvpn:latest debian.buildbox.openvpn/

debian-logstash:
	docker build -t lmac-debian-logstash:latest debian.logstash/

ubuntu-base:
	docker build -t lmac-ubuntu-base:latest ubuntu.base/

ubuntu-buildbox:
	docker build -t lmac-ubuntu-buildbox:latest ubuntu.buildbox/

ubuntu-buildbox-openvpn:
	docker build -t lmac-ubuntu-buildbox-openvpn:latest ubuntu.buildbox.openvpn/

ubuntu-mybox:
	docker build -t lmac-ubuntu-mybox:latest ubuntu.mybox/

node:
	docker pull node

ruby:
	docker pull ruby

jruby:
	docker pull jruby

python:
	docker pull python

redis:
	docker pull redis

mysql:
	docker pull mysql

node-redis-commander:
	docker build -t lmac-node-redis-commander:latest node.redis.commander/


