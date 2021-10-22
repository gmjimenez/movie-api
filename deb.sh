#!/bin/bash
sudo su
WORKDIR=$(pwd)
mkdir DEBIAN
#mkdir -p $WORKDIR/usr/local/bin cp /usr/local/bin/deb.sh $WORKDIR/usr/local/bin/
cat >  DEBIAN/control << EOF
Package: movie-api
Version: 0.2
Maintainer: melissa.jimenezc
Architecture: all
Description: api 
EOF
touch DEBIAN/postinst
chmod +x DEBIAN/postinst
dpkg-deb --build $WORKDIR
ls
cd ..
ls

#