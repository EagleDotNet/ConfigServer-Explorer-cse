#!/bin/sh

if [ ! -e "install.sh" ]; then
	echo "You must cd to the package directory that you expanded"
	exit
fi

#First replace:
if [ -e "/usr/local/cyberpanel/3rdparty/bin/perl" ]; then
    find ./ -type f -exec sed -i 's%^#\!/usr/bin/perl%#\!/usr/local/cyberpanel/3rdparty/bin/perl%' {} \;
fi

mkdir /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver
chmod 700 /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver
mkdir /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse
chmod 700 /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse

cp -avf cse.cgi /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse.cgi
chmod -v 700 /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse.cgi

cp -avf cseversion.txt /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/cseversion.txt
cp -avf cse/ /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/
cp -avf downloadservers /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/downloadservers

VERSION=`cat /usr/local/cyberpanel/version | cut -d '.' -f2`
if [ "$VERSION" -lt "65" ]; then
    sed -i "s/^target=.*$/target=mainFrame/" cse.conf
    echo "cyberpanel v$VERSION, target set to mainFrame"
else
    sed -i "s/^target=.*$/target=_self/" cse.conf
    echo "cyberpanel v$VERSION, target set to _self"
fi

cp -avf cse.conf /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/cse.conf
cp -avf upgrade.sh /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/upgrade.sh
chmod 700 /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/upgrade.sh
cp -af cse/cse.png /usr/local/cyberpanel/whostmgr/docroot/addon_plugins/
cp -af cse.tmpl /usr/local/cyberpanel/whostmgr/docroot/templates/

if [ -e "/usr/local/cyberpanel/bin/register_appconfig" ]; then
    /usr/local/cyberpanel/bin/register_appconfig /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/cse.conf

    /bin/rm -f /usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi
    /bin/rm -f /usr/local/cyberpanel/whostmgr/docroot/cgi/cseversion.txt
    /bin/rm -Rf /usr/local/cyberpanel/whostmgr/docroot/cgi/cse
else
    cp -avf cse.cgi /usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi
    chmod -v 700 /usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi
    cp -avf cseversion.txt /usr/local/cyberpanel/whostmgr/docroot/cgi/cseversion.txt
    cp -avf cse/ /usr/local/cyberpanel/whostmgr/docroot/cgi/
    if [ ! -d "/var/cyberpanel/apps" ]; then
        mkdir /var/cyberpanel/apps
        chmod 755 /var/cyberpanel/apps
    fi
    /bin/cp -avf cse.conf.old /var/cyberpanel/apps/cse.conf
    chmod 600 /var/cyberpanel/apps/cse.conf
fi

#Second replace
if [ -e "/usr/local/cyberpanel/3rdparty/bin/perl" ]; then
	find ./ -type f -exec sed -i 's%^#\!/usr/local/cyberpanel/3rdparty/bin/perl%#\!/usr/bin/perl%' {} \;
fi

echo "ConfigServer Explorer has been installed."
exit
