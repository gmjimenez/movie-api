#!/bin/bash -e
if [ $UID != 65587 ]; then
    echo "You have to run this on Docker" 1>&2
    exit 1
fi
#Suppress running outside of Docker container

export EDITOR=vim
cd /debuild/build/$NAME

#Describe the process before build

debuild -us -uc
#Build

cd ..
tar cf ${BASE_FILES}serene${VERSION:5}.tar \
base-files-dbgsym_${BASE_FILES:11}serene${VERSION:5}_amd64.ddeb \
base-files_${BASE_FILES:11}serene${VERSION:5}.dsc \
base-files_${BASE_FILES:11}serene${VERSION:5}_amd64.build \
base-files_${BASE_FILES:11}serene${VERSION:5}_amd64.buildinfo \
base-files_${BASE_FILES:11}serene${VERSION:5}_amd64.changes \
base-files_${BASE_FILES:11}serene${VERSION:5}_amd64.deb \
lsb-release-udeb_${BASE_FILES:11}serene${VERSION:5}_all.udeb
zstd ${BASE_FILES}serene${VERSION:5}.tar
sudo mv -f *.xz /deb 2>/dev/null
sudo mv -f *.zst /deb 2>/dev/null
sudo chown -R ${H_UGID} /deb 2>/dev/null
#Tar the build.Compress to zst, to shared directory with host with source package