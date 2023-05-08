FROM ubuntu:22.04
LABEL maintainer="citraemu"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y full-upgrade
RUN apt-get install -y p7zip-full wget git flatpak flatpak-builder glslang-dev glslang-tools ca-certificates sshfs curl dnsutils gnupg2 sudo
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.kde.Platform//5.15-22.08 org.kde.Sdk//5.15-22.08 org.kde.Platform//6.4 org.kde.Sdk//6.4
