FROM dockerfile/ubuntu-desktop
MAINTAINER Roy ROQUE <roy.e.roque@gmail.com>

RUN sudo apt-get update
RUN sudo apt-get install -y supervisor
RUN sudo apt-get install -y firefox
RUN sudo apt-get install -y ruby1.9.3
RUN sudo apt-get install -y xvfb
RUN sudo gem install --no-rdoc --no-ri watir headless minitest minitest-reporters zip rake

RUN mkdir -p ~/.vnc
RUN echo 'Hello!23' | vncpasswd -f > ~/.vnc/passwd
RUN chmod 600 ~/.vnc/passwd

VOLUME /tmp/shared

# Expose VNC ports
EXPOSE 5901

WORKDIR /data
CMD vncserver :1 -name vnc -geometry 1280x800 && tail -f ~/.vnc/*:1.log

