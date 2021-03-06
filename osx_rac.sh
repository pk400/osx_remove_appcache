#! /bin/bash

# Directory containing app scripts
declare SCRIPTS_DIR="scripts"

# Script should only be run on OSX. Will exit if on another OS
if [[ $(uname) == "Darwin" ]]
then
	# Script needs sudo permissions to run, because tries to access files and
	# directories outside the user's home directory

	cd $SCRIPTS_DIR

	if [[ $# < 1 ]]
	then
		# Run each of the script contained in the scripts directory. They are ran
		# in order of how they are displayed in the `ls` command
		for SCRIPT in $(ls)
		do
			echo "Running $SCRIPT.sh script.."
			source ./$SCRIPT
			echo ""
		done
	else
		# If the user wants to run a selection of scripts. They can add them as arguments
		for ARG in $@
		do
			echo "Running $ARG.sh script .."
			source ./$SCRIPT/$ARG.sh
			echo ""
		done | sort
	fi
else
	echo "Script is only for machines running OSX."
	exit 1
fi
