FROM ubuntu:trusty
ARG VERSION=master

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y make unrar-free autoconf automake libtool gcc g++ gperf \
    flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
    sed git unzip bash help2man wget bzip2

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && useradd --no-create-home micropython

RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git 
RUN git clone https://github.com/pfalcon/pycopy.git
RUN cd pycopy && git checkout $VERSION && git submodule update --init
RUN chown -R micropython:micropython ../esp-open-sdk ../pycopy

USER micropython

RUN cd esp-open-sdk && make STANDALONE=y

ENV PATH=/esp-open-sdk/xtensa-lx106-elf/bin:$PATH

RUN cd ../pycopy/mpy-cross && make

RUN cd ../pycopy/ports/esp8266 && make
