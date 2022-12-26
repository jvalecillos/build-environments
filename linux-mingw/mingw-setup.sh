#!/usr/bin/bash -e
# install pefile
pip3 install pefile

# ffmpeg
FFMPEG_VER='5.1.2'
FILENAME="ffmpeg-n${FFMPEG_VER}-9-g807afa59cc-win64-gpl-shared-${FFMPEG_VER%.*}"
echo "Downloading ffmpeg (${FFMPEG_VER})..."
wget -c "https://github.com/BtbN/FFmpeg-Builds/releases/download/autobuild-2022-12-25-12-38/${FILENAME}.zip"
7z x "${FILENAME}.zip"

echo "Copying ffmpeg ${FFMPEG_VER} files to sysroot..."
cp -v "${FILENAME}"/bin/*.dll /usr/x86_64-w64-mingw32/lib/
cp -vr "${FILENAME}"/include /usr/x86_64-w64-mingw32/
cp -v "${FILENAME}"/lib/*.{a,def} /usr/x86_64-w64-mingw32/lib/

# remove the directory
ABS_PATH="$(readlink -f $0)"
rm -rf "$(dirname ${ABS_PATH})"
