#!/usr/bin/bash -e
# install pefile
pip3 install pefile

# SDL2
SDL2_VER='2.0.22'
wget "https://www.libsdl.org/release/SDL2-devel-${SDL2_VER}-mingw.tar.gz"
tar -zxf "SDL2-devel-${SDL2_VER}-mingw.tar.gz"
cd SDL2-${SDL2_VER}/
make install-package arch=x86_64-w64-mingw32 prefix=/usr/x86_64-w64-mingw32;
cd ..

# ffmpeg
FFMPEG_VER='4.4.2'
FILENAME="ffmpeg-n${FFMPEG_VER}-95-ga8f16d4eb4-win64-gpl-shared-${FFMPEG_VER%.*}"
echo "Downloading ffmpeg (${FFMPEG_VER})..."
wget -c "https://github.com/BtbN/FFmpeg-Builds/releases/download/autobuild-2022-10-03-12-38/${FILENAME}.zip"
7z x "${FILENAME}.zip"

echo "Copying ffmpeg ${FFMPEG_VER} files to sysroot..."
cp -v "${FILENAME}"/bin/*.dll /usr/x86_64-w64-mingw32/lib/
cp -vr "${FILENAME}"/include /usr/x86_64-w64-mingw32/
cp -v "${FILENAME}"/lib/*.{a,def} /usr/x86_64-w64-mingw32/lib/

# remove the directory
ABS_PATH="$(readlink -f $0)"
rm -rf "$(dirname ${ABS_PATH})"
