#! /bin/bash

sudo pkill Viscosity

launchctl unload /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
defaults delete com.viscosityvpn.Viscosity

sudo rm /Library/PrivilegedHelperTools/com.sparklabs.ViscosityHelper
sudo rm /Library/LaunchDaemons/com.sparklabs.ViscosityHelper.plist
sudo rm $HOME/Library/Preferences/com.viscosityvpn.Viscosity.plist
sudo rm $HOME/Library/Caches/com.viscosityvpn.Viscosity
sudo rm -R /Library/Application\ Support/Viscosity
sudo rm -R $HOME/Library/Application\ Support/Viscosity