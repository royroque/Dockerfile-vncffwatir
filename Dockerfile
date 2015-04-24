FROM ubuntu:14.04
MAINTAINER Roy ROQUE <roy.e.roque@gmail.com>

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update
RUN sudo apt-get install -y supervisor
RUN sudo apt-get install -y xvfb
RUN sudo apt-get -y install wget build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

# Install Ruby
RUN \
  apt-get -y update && \
  cd /tmp && \
  wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p643.tar.gz && \
  tar -xvzf ruby-2.0.0-p643.tar.gz && \
  cd ruby-2.0.0-p643 && \
  ./configure --prefix=/usr/local && \
  make && \
  make install && \
  rm -rf /tmp/ruby-2.0.0-p643 

# Install Gems
RUN sudo gem install --no-rdoc --no-ri watir headless rspec zip rest-client
RUN sudo gem uninstall -I watir-webdriver
RUN sudo gem install --no-rdoc --no-ri watir-webdriver --version '0.6.11'
RUN sudo gem uninstall -I selenium-webdriver
RUN sudo gem install --no-rdoc --no-ri selenium-webdriver --version '2.44.0'


# INSTALL LATEST FIREFOX ESR: 
ADD ff/firefox-*esr.tar.bz2 /opt
RUN sudo ln -s /opt/firefox/firefox /usr/bin/firefox

RUN mkdir -p ~/.vnc 
RUN echo 'Hello!23' | vncpasswd -f > ~/.vnc/passwd 
RUN chmod 600 ~/.vnc/passwd

EXPOSE 5901

VOLUME /media/shared

## Sample Test included ; can be executed once inside the container with:
## docker exec -it vncffwatir ruby /tmp/test/google_search.rb
WORKDIR /tmp
COPY /test /tmp/test

CMD vncserver :1 -name vnc -geometry 1280x800 && tail -f ~/.vnc/*:1.log
