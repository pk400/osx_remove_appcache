#!/bin/bash

sudo pkill Vidyo

/Applications/Vidyo/Vidyo\ Desktop/VidyoDesktop\ Uninstaller.app/Contents/MacOS/VidyoDesktop\ Uninstaller > /dev/null

rm $HOME/Library/Preferences/com.Vidyo.VidyoDesktop.plist 
rm /Library/Preferences/com.Vidyo.VidyoDesktop.plist
