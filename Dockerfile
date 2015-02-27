FROM dockerfile/ubuntu-desktop
MAINTAINER Roy ROQUE <roy.e.roque@gmail.com>

RUN sudo apt-get update
RUN sudo apt-get install -y supervisor
RUN sudo apt-get install -y ruby1.9.3
RUN sudo apt-get install -y xvfb
RUN sudo gem install --no-rdoc --no-ri watir headless minitest minitest-reporters zip rake

# INSTALL LATEST FIREFOX ESR: 
ADD ff/firefox-*esr.tar.bz2 /opt
RUN sudo ln -s /opt/firefox/firefox /usr/bin/firefox

RUN mkdir -p ~/.vnc 
RUN echo 'Hello!23' | vncpasswd -f > ~/.vnc/passwd 
RUN chmod 600 ~/.vnc/passwd

EXPOSE 5901

VOLUME /media/shared
WORKDIR /tmp

## Sample Test included
## sample test can be executed once inside the container;
## docker exec -it watirheadless /bin/bash
COPY /test /tmp/test

CMD vncserver :1 -name vnc -geometry 1280x800 && tail -f ~/.vnc/*:1.log
