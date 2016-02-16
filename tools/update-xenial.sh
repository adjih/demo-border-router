#! /bin/sh
#---------------------------------------------------------------------------
# CA - Inria - 2016
#---------------------------------------------------------------------------

#---------------------------------------------------------------------------

#personnal preferences
if [ "$1" == "adjih" ] ; then
    sudo apt-get -y remove unity
    sudo apt-get -y install ubuntu-mate-default-settings ubuntu-mate-desktop \
     ubuntu-mate-welcome mate-session-manager mate-terminal \
     mate-desktop-environment
fi
  
#---------------------------------------------------------------------------

sudo apt-get -y install git 
sudo apt-get -y install jed emacs vim
sudo apt-get -y install binutils-arm-none-eabi gcc-arm-none-eabi openocd


sudo apt-get -y install python-pip
sudo pip install grip # render markdown

test -e ../tools || exit 1

#---------------------------------------------------------------------------
