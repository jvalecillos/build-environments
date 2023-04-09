FROM debian:11
LABEL maintainer="citraemu"
ENV DEBIAN_FRONTEND=noninteractive

# Create a user account citra (UID 1027) that the container will run as
RUN useradd -m -u 1027 -s /bin/bash citra 
RUN apt-get update && apt-get -y full-upgrade
RUN apt-get install -y \
    p7zip-full \
    build-essential \
    software-properties-common \
    libsdl2-dev \
    qtbase5-dev \
    qtbase5-private-dev \
    libqt5opengl5-dev \
    qtmultimedia5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    libavcodec-dev \
    libavfilter-dev \
    libavformat-dev \
    libswscale-dev \
    wget \
    git \
    ccache \
    ninja-build \
    libssl-dev \
    libqt5multimedia5-plugins \
    ffmpeg \
    libavdevice-dev \
    glslang-dev \
    glslang-tools \
    qt5-gtk-platformtheme \
    qt5ct \
    qt5-style-plugins \
    && \
# Install updated version of cmake and missing libfdk-aac-dev
    apt-add-repository 'deb http://deb.debian.org/debian bullseye main contrib non-free' && \
    apt-add-repository 'deb http://deb.debian.org/debian bullseye-backports main contrib non-free' && \
    apt-get update -y && \
    apt-get install -y \
    libfdk-aac-dev \
    cmake/bullseye-backports
# Downloading Tools for Building AppImages
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
RUN wget https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage
RUN chmod a+x linuxdeploy-x86_64.AppImage
RUN chmod a+x linuxdeploy-plugin-qt-x86_64.AppImage
