#!/bin/sh

if [ -e "/usr/local/cyberpanel/bin/unregister_appconfig" ]; then
    cd /
    /usr/local/cyberpanel/bin/unregister_appconfig cse
else
    if [ ! -e "/var/cyberpanel/apps/cse.conf" ]; then
        /bin/rm -fv /var/cyberpanel/apps/cse.conf
    fi
fi

/bin/rm -fv /usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi
/bin/rm -fv /usr/local/cyberpanel/whostmgr/docroot/cgi/cseversion.txt
/bin/rm -Rfv /usr/local/cyberpanel/whostmgr/docroot/cgi/cse

/bin/rm -fv /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse.cgi
/bin/rm -fv /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cseversion.txt
/bin/rm -Rfv /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse

echo "ConfigServer Explorer has been uninstalled."
exit
