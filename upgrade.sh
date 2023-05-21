#!/bin/sh

if [ -e "/usr/local/cyberpanel/bin/register_appconfig" ]; then
    if [ -e "/usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi" ]; then
        /usr/local/cyberpanel/bin/register_appconfig /usr/local/cyberpanel/whostmgr/docroot/cgi/configserver/cse/cse.conf

        /bin/rm -f /usr/local/cyberpanel/whostmgr/docroot/cgi/addon_cse.cgi
        /bin/rm -f /usr/local/cyberpanel/whostmgr/docroot/cgi/cseversion.txt
        /bin/rm -Rf /usr/local/cyberpanel/whostmgr/docroot/cgi/cse
    fi
fi
