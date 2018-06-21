#! /bin/bash

declare SCRIPTS_DIR="scripts"

if [[ $(uname) == "Darwin" ]]
then
	# Script needs sudo permissions to run, because tries to access files and
	# directories outside the user's home directory
	if [[ $(id -u) -ne 0 ]]
	then
		echo "Script needs admin privileges to run. Please try again with sudo."
		exit 1
	fi

	cd $SCRIPTS_DIR

	if [[ $# < 1 ]]
	then
		# Run each of the script contained in the scripts directory. They are ran
		# in order of how they are displayed in the `ls` command
		for SCRIPT in $(ls)
		do
			echo "Running $SCRIPT .."
			source ./$SCRIPT
			echo ""
		done
	else
		# If the user wants to run a selection of scripts. They can add them as arguments
		for ARG in $@
		do
			echo "Running $ARG .."
			source ./$SCRIPT/$ARG.sh
			echo ""
		done | sort
	fi
else
	echo "Script is only for machines running OSX."
	exit 1
fi
