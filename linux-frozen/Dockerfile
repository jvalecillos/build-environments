FROM ubuntu:22.04
LABEL maintainer="citraemu"
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /tmp/pkgs
COPY install_package.py /tmp/pkgs
RUN apt-get update && apt-get install -y \
    p7zip-full \
    build-essential \
    software-properties-common \
    wget \
    git \
    python3-launchpadlib \
    ccache \
    ninja-build \
    && \
# Install updated version of glslang
    add-apt-repository -y ppa:savoury1/ffmpeg4 && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y \
    glslang-dev \
    glslang-tools

RUN cd /tmp/pkgs && python3 install_package.py \
    libsdl2-dev 2.0.20+dfsg-2build1 jammy      \
    qtbase5-dev 5.15.3+dfsg-2 jammy            \
    qtbase5-private-dev 5.15.3+dfsg-2 jammy    \
    libqt5opengl5-dev 5.15.3+dfsg-2 jammy      \
    qt5-qmltooling-plugins 5.15.3+dfsg-1 jammy \
    qtdeclarative5-dev 5.15.3+dfsg-1 jammy     \
    qtmultimedia5-dev 5.15.3-1 jammy           \
    libicu70 70.1-2 jammy                      \
    cmake 3.22.1-1ubuntu1 jammy                \
    libavcodec-dev 7:4.4.2-0ubuntu0.22.04.1 jammy \
    libavformat-dev 7:4.4.2-0ubuntu0.22.04.1 jammy \
    libswscale-dev 7:4.4.2-0ubuntu0.22.04.1 jammy
RUN rm -rf /tmp/pkgs
