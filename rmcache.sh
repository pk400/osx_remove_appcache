#! /bin/bash

declare SCRIPTS_DIR="scripts_og"

# Script needs sudo permissions to run, because tries to access files and
# directories outside the user's home directory
if [[ $(id -u) -ne 0 ]]
then
	echo "Script needs admin privileges to run. Please try again with sudo."
	exit 1
fi

cd $SCRIPTS_DIR

for SCRIPT in $(ls)
	do echo "Running $SCRIPT .."
	source ./$SCRIPT
	echo ""
done