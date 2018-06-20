#! /bin/bash

sudo pkill Viscosity
sleep 1

launchctl unload /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
defaults delete com.viscosityvpn.Viscosity

sudo rm /Library/PrivilegedHelperTools/com.sparklabs.ViscosityHelper
sudo rm /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
sudo rm -R /Library/Application\ Support/Viscosity
sudo rm -R /Users/$USER/Library/Application\ Support/Viscosity
