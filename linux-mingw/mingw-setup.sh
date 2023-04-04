#!/usr/bin/bash -e
# install pefile
pip3 install pefile

# ffmpeg
FFMPEG_VER='6.0'
LINK_PATH="autobuild-2023-03-31-12-50/ffmpeg-n6.0-11-g3980415627-win64-gpl-shared-6.0"
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
