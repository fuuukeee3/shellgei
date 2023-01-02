FROM ubuntu:22.04

RUN yes | unminimize
RUN apt-get update
RUN apt install -y locales vim sudo man less manpages-ja manpages-ja-dev language-pack-ja gawk psmisc ruby-full nkf

RUN apt install -y mecab libkkc-utils translate-shell

RUN locale-gen ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8

RUN groupadd -g 1000 sg && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo sg
RUN echo sg:sg | chpasswd
RUN echo "sg ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

USER sg
RUN mkdir /home/sg/work
WORKDIR /home/sg/work

RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
RUN sudo apt install -y git imagemagick
RUN git clone https://github.com/shellgei/shellgei160
