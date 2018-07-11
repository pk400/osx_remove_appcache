#! /bin/bash
# Declare commands to execute
CHECK_PROCESS=$(ps aux | pgrep -i viscosity | wc -l)
CHECK_CONFIG=$(launchctl list | grep -c viscosity)
CHECK_DOMAIN=$(defaults domains | sed 's/,/\'$'\n/g' | grep '$DEFAULTS_DOMAIN')

# Declare paths
LIB_PATH='$HOME/Library/'
PATHS=(
    $LIB_PATH'Caches/com.viscosityvpn.Viscosity'
    $LIB_PATH'Preferences/com.viscosityvpn.Viscosity.plist'
    $LIB_PATH'Application\ Support/Viscosity'
    ${LIB_PATH:5:9}'PrivilegedHelperTools/com.sparklabs.ViscosityHelper'
    ${LIB_PATH:5:9}'LaunchDaemons/com.sparklabs.ViscosityHelper.plist'
    ${LIB_PATH:5:9}'Application\ Support/Viscosity')
DEFAULTS_DOMAIN='com.viscosityvpn.Viscosity'
CONFIG_PLIST_PATH=${LIB_PATH:5:9}'LaunchDaemons/com.sparklabs.ViscosityHelper.plist'

rmpath() {
    sudo rm -f "$1"
}

# To avoid conflicts, close all instances of Viscosity
if [[ $CHECK_PROCESS -gt 0 ]]
then
    pkill Viscosity
else
    echo "Viscosity not open"
fi

# TODO: Figure out why machine needs to be restarted. I have a feeling it may 
# be related to launchctl
if [[ $CHECK_CONFIG -ne 0 ]]
then
    launchctl unload $CONFIG_PLIST_PATH
else
    echo "ViscosityHelper already unloaded"
fi

if [[ $CHECK_DOMAIN -gt 0 ]]
then
    defaults delete $DEFAULTS_DOMAIN 2> /dev/null
else
    echo "Viscosity domain not found!"
fi

for p in "${PATHS[@]}"
do
    rmpath $p
done

echo "viscosity.sh completed. Restart your machine"
