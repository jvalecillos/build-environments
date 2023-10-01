FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
LABEL maintainer="citraemu"

ENV DEBIAN_FRONTEND=noninteractive

# Create a user account citra (UID 1027) that the container will run as
RUN useradd -m -u 1027 -s /bin/bash citra

# Update system, install PPAs and install packages for building Citra.
RUN apt-get update && apt-get full-upgrade -y
RUN apt-get install -y software-properties-common lsb-release curl
RUN apt-get update
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN add-apt-repository -y ppa:okirby/qt6-backports
RUN add-apt-repository -y ppa:okirby/qt6-testing
RUN add-apt-repository -y ppa:theofficialgman/gpu-tools
RUN curl -s https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 42D5A192B819C5DA
RUN add-apt-repository -y 'deb https://apt.kitware.com/ubuntu/ focal main'
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Add arm64 architecture
RUN dpkg --add-architecture arm64
RUN sh -c "sed \"s|^deb \([a-z\.:/]*\) \([a-z\-]*\) \(.*\)$|deb [arch=amd64] \1 \2 \3\ndeb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports \2 \3|\" /etc/apt/sources.list > /etc/apt/sources.list.new"
RUN rm /etc/apt/sources.list
RUN mv /etc/apt/sources.list.new /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    libsdl2-dev:arm64 \
    libssl-dev:arm64 \
# Qt 6
    qt6-base-dev:arm64 \
    qt6-base-private-dev:arm64 \
    qt6-multimedia-dev:arm64 \
    qt6-l10n-tools \
    qt6-tools-dev:arm64 \
    qt6-tools-dev-tools:arm64 \
    qt6-documentation-tools:arm64 \
# FFmpeg
    ffmpeg:arm64 \
    libavcodec-dev:arm64 \
    libavdevice-dev:arm64 \
    libavfilter-dev:arm64 \
    libavformat-dev:arm64 \
    libswresample-dev:arm64 \
    libswscale-dev:arm64 \
# Tools
    cmake \
    p7zip-full \
    wget \
    unzip \
    git \
    ccache \
    ninja-build \
    glslang-dev \
    glslang-tools \
    patchelf \
    file \
    zstd
    
# Install GCC 11
RUN wget https://github.com/xieyubo/gcc-build/releases/download/gcc-11.2.0-1/gcc-11.2.0-1-ubuntu-20.04.deb
RUN apt install -y ./gcc-11.2.0-1-ubuntu-20.04.deb
