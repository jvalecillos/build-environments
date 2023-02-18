#!/usr/bin/bash -e
# install pefile
pip3 install pefile

# ffmpeg
FFMPEG_VER='5.1.2'
LINK_PATH="autobuild-2023-01-28-12-37/ffmpeg-n5.1.2-11-g30d432f205-win64-gpl-shared-5.1"
FILENAME="${LINK_PATH##*/}"
echo "Downloading ffmpeg (${FFMPEG_VER})..."
wget -c "https://github.com/BtbN/FFmpeg-Builds/releases/download/${LINK_PATH}.zip"
7z x "${FILENAME}.zip"

echo "Copying ffmpeg ${FFMPEG_VER} files to sysroot..."
cp -v "${FILENAME}"/bin/*.dll /usr/x86_64-w64-mingw32/lib/
cp -vr "${FILENAME}"/include /usr/x86_64-w64-mingw32/
cp -v "${FILENAME}"/lib/*.{a,def} /usr/x86_64-w64-mingw32/lib/

# remove the directory
ABS_PATH="$(readlink -f $0)"
rm -rf "$(dirname ${ABS_PATH})"
