FROM arm64v8/ubuntu:20.04
SHELL ["/bin/bash", "-c"]
LABEL maintainer="citraemu"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
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
RUN apt-get install -y \
            libsdl2-dev \
            libssl-dev \
            qt6-base-dev \
            qt6-base-private-dev \
            qt6-multimedia-dev \
            qt6-l10n-tools \
            qt6-tools-dev \
            qt6-tools-dev-tools \
            qt6-documentation-tools \
            ffmpeg \
            libavcodec-dev \
            libavdevice-dev \
            libavfilter-dev \
            libavformat-dev \
            libswresample-dev \
            libswscale-dev \
            p7zip-full \
            wget \
            unzip \
            git \
            ccache \
            glslang-dev \
            glslang-tools \
            patchelf \
            desktop-file-utils \
            file
