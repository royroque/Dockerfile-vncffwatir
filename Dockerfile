FROM ubuntu:14.04
MAINTAINER Roy ROQUE <roy.e.roque@gmail.com>

## Install LXDE and VNC server
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*
RUN mkdir -p ~/.vnc 
RUN echo 'Hello!23' | vncpasswd -f > ~/.vnc/passwd 
RUN chmod 600 ~/.vnc/passwd
EXPOSE 5901

RUN \
  apt-get update && \
  apt-get install -y \
    supervisor \ 
    xvfb \ 
    wget \
    curl \
    git \
    build-essential \
    zlib1g-dev \
    libssl-dev \
    libreadline6-dev \ 
    libyaml-dev \
    libmysqlclient-dev \ 
    mailutils \
    fetchmail

## Install Ruby
RUN \
  apt-get -y update && \
  cd /tmp && \
  wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.6.tar.gz && \
  tar -xvzf ruby-2.1.6.tar.gz && \
  cd ruby-2.1.6 && \
  ./configure --prefix=/usr/local && \
  make && \
  sudo make install && \
  gem install bundler && \
  rm -rf /tmp/ruby-2.1.6 

## Install Gems
RUN \
  sudo gem install --no-rdoc --no-ri watir headless rspec zip rest-client mysql2 && \
  sudo gem uninstall -I watir-webdriver && \
  #sudo gem install --no-rdoc --no-ri watir-webdriver --version '0.6.11' && \
  sudo gem install --no-rdoc --no-ri watir-webdriver --version '0.8.0' && \
  sudo gem uninstall -I selenium-webdriver && \
  #sudo gem install --no-rdoc --no-ri selenium-webdriver --version '2.44.0' && \
  sudo gem install --no-rdoc --no-ri selenium-webdriver --version '2.46.2' 

## Install Latest Version of firefox ESR: (pre-downloaded in ./ff folder) 
ADD ff/firefox-*esr.tar.bz2 /opt
RUN sudo ln -s /opt/firefox/firefox /usr/bin/firefox

VOLUME /media/shared
WORKDIR /media/shared

#CMD bash
#CMD vncserver :1 -name vnc -geometry 1280x800 && tail -F ~/.vnc/*.log
CMD vncserver :1 -name vnc -geometry 1408x864 && tail -F ~/.vnc/*.log
