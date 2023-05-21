# ConfigServer-Explorer-cse
This is an attempt to run ConfigServer Explorer cse on cyberpanel

#########################################################################

To install or upgrade cse simply do the following from the root shell via SSH:

cd /usr/src

rm -fv /usr/src/CSE.zip

wget https://github.com/EagleDotNet/ConfigServer-Explorer-cse/archive/refs/tags/CSE.zip

unzip CSE.zip

cd ConfigServer-Explorer-cse-CSE

sh install.sh

rm -Rfv /usr/src/ConfigServer-Explorer-cse-CSE*

Then login to Cyberpanel and scroll to the bottom of the left hand menu and you should see "ConfigServer Explorer"

#########################################################################

If you want to uninstall, simply:

cd /usr/src

rm -fv CSE.zip

wget https://github.com/EagleDotNet/ConfigServer-Explorer-cse/archive/refs/tags/CSE.zip

unzip CSE.zip

cd ConfigServer-Explorer-cse-CSE

sh uninstall.sh

rm -Rfv /usr/src/ConfigServer-Explorer-cse-CSE*

#########################################################################
