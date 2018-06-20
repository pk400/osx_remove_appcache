#! /bin/bash
echo "sleeping"; sleep 5
sudo pkill Viscosity
launchctl unload /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
sudo rm /Library/PrivilegedHelperTools/com.sparklabs.ViscosityHelper
sudo rm /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
sudo rm -R /Library/Application\ Support/Viscosity
sudo rm -R /Users/$USER/Library/Application\ Support/Viscosity

defaults delete com.viscosityvpn.Viscosity