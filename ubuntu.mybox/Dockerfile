FROM lmac-ubuntu-base

RUN apt-get update
RUN apt-get install -y vim tmux git

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/leprechaun && \
    echo "leprechaun:x:${uid}:${gid}:Developer,,,:/home/leprechaun:/bin/bash" >> /etc/passwd && \
    echo "leprechaun:x:${uid}:" >> /etc/group && \
    echo "leprechaun ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/leprechaun && \
    chmod 0440 /etc/sudoers.d/leprechaun && \
    chown ${uid}:${gid} -R /home/leprechaun

USER leprechaun
ENV HOME /home/leprechaun
