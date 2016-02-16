#! /bin/sh
# CA, 2016: https://github.com/RIOT-OS/RIOT/wiki/OpenOCD

sudo apt-get -y install build-essential autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev

git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap || exit 1

./configure || exit 1
# NOT replaced by: http://watr.li/samr21-dev-setup-ubuntu.html
#./configure --enable-maintainer-mode \
#                --enable-cmsis-dap \
#                --enable-hidapi-libusb || exit 1

make || exit 1
sudo apt-get -y remove openocd
sudo make install || exit 1
