#! /bin/bash

sudo pkill Slack

defaults delete com.tinyspeck.slackmacgap.helper
defaults delete com.tinyspeck.slackmacgap

sudo rm -R $HOME/Library/Application\ Support/Slack