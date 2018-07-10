#! /bin/bash

DEFAULTS_DOMAIN='com.viscosityvpn.Viscosity'
CONFIG_PLIST_PATH='/Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist'

CHECK_PROCESS=$(ps aux | pgrep -i viscosity | wc -l)
CHECK_CONFIG=$(launchctl list | grep -c viscosity)
CHECK_DOMAIN=$(defaults domains | sed 's/,/\'$'\n/g' | grep '$DEFAULTS_DOMAIN')

HELPER_PHT_PATH='/Library/PrivilegedHelperTools/com.sparklabs.ViscosityHelper'
HELPER_DAEMON_PATH='/Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist'
USR_CACHE_PATH='$HOME/Library/Caches/com.viscosityvpn.Viscosity'
USR_PREF_PATH='$HOME/Library/Preferences/com.viscosityvpn.Viscosity.plist'
APPSUPPORT_PATH='/Library/Application\ Support/Viscosity'
USR_APPSUPPORT_PATH='$HOME/Library/Application\ Support/Viscosity'

# To avoid conflicts, close all instances of Viscosity
if [[ $CHECK_PROCESS -gt 0 ]]
then
    echo "Viscosity open."
    pkill Viscosity
else
    echo "Viscosity not open"
fi

if [[ $CHECK_CONFIG -ne 0 ]]
then
    echo "Viscosity loaded, unloading"
    launchctl unload $CONFIG_PLIST_PATH
else
    echo "ViscosityHelper already unloaded"
fi

if [[ $CHECK_DOMAIN -gt 0 ]]
then
    echo "Viscosity domain found!"
    defaults delete $DEFAULTS_DOMAIN 2> /dev/null
else
    echo "Viscosity domain not found!"
fi

[ -e $HELPER_PHT_PATH ] && rm $HELPER_PHT_PATH
[ -e $HELPER_DAEMON_PATH ] && rm $HELPER_DAEMON_PATH
[ -e $USR_CACHE_PATH ] && rm -rf $USR_CACHE_PATH
[ -e $USR_PREF_PATH ] && rm -rf $USR_PREF_PATH
[ -e $APPSUPPORT_PATH ] && rm -rf $APPSUPPORT_PATH
[ -e $USR_APPSUPPORT_PATH ] && rm -rf $USR_APPSUPPORT_PATH

: '
rm /Library/PrivilegedHelperTools/com.sparklabs.ViscosityHelper
rm /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
rm $HOME/Library/Preferences/com.viscosityvpn.Viscosity.plist
rm $HOME/Library/Caches/com.viscosityvpn.Viscosity
rm -R /Library/Application\ Support/Viscosity
rm -R $HOME/Library/Application\ Support/Viscosity
'
