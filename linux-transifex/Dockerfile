FROM debian:bullseye-slim
LABEL maintainer="citraemu"

ENV DEBIAN_FRONTEND=noninteractive
ENV CMAKE_VER=3.22.6

RUN apt-get update && apt-get -y full-upgrade
RUN apt-get install -y git p7zip-full libqt5opengl5-dev qtmultimedia5-dev qttools5-dev qttools5-dev-tools python3-pip cmake curl unzip zip
RUN curl -O -L https://github.com/transifex/cli/releases/latest/download/tx-linux-amd64.tar.gz && tar xf tx-linux-amd64.tar.gz tx && mv tx /usr/bin/tx && rm tx-linux-amd64.tar.gz

# Install CMake from upstream
RUN cd /tmp
RUN curl -OL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}/cmake-${CMAKE_VER}-linux-x86_64.tar.gz && \
    tar xvf cmake-${CMAKE_VER}-linux-x86_64.tar.gz && \
    cp -rv cmake-${CMAKE_VER}-linux-x86_64/* /usr && \
    rm -rf cmake-*
