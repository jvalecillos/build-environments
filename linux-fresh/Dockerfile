FROM ubuntu:22.04
LABEL maintainer="citraemu"
ENV DEBIAN_FRONTEND=noninteractive

# Create a user account citra (UID 1027) that the container will run as
RUN useradd -m -u 1027 -s /bin/bash citra 

RUN apt-get update && apt-get -y full-upgrade
RUN apt-get install -y \
    # Tools
    build-essential \
    ccache \
    clang-format-12 \
    cmake \
    curl \
    git \
    ninja-build \
    p7zip-full \
    python3-pip \
    software-properties-common \
    unzip \
    wget \
    zip \
    # Qt 6
    qt6-base-dev \
    qt6-base-private-dev \
    libqt6opengl6-dev \
    qt6-multimedia-dev \
    qt6-l10n-tools \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    libgl-dev \
    # Other libraries
    libsdl2-dev

# Install updated version of glslang
RUN add-apt-repository -y ppa:theofficialgman/gpu-tools
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    glslang-dev \
    glslang-tools

# Install Transifex client
RUN curl -O -L https://github.com/transifex/cli/releases/latest/download/tx-linux-amd64.tar.gz && \
    tar xf tx-linux-amd64.tar.gz tx && \
    mv tx /usr/bin/tx && \
    rm tx-linux-amd64.tar.gz

