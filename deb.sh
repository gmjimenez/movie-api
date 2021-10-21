#!/bin/bash
mkdir helloworld && mkdir helloworld/DEBIAN
mkdir -p helloworld/usr/local/bin cp /usr/local/bin/helloworld.sh helloworld/usr/local/bin/
cat > helloworld/DEBIAN/control << EOF
Package: helloworld
Version: 0.2
Maintainer: King Foo
Architecture: all
Description: hello world 
EOF
touch postinst
dpkg-deb --build helloworld

#