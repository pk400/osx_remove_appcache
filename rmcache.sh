#! /bin/bash

declare FILE="paths.json";

# Script needs sudo permissions to run, because tries to access files and
# directories outside the user's home directory
if [[ $(id -u) -ne 0 ]]
then
	echo "Script needs admin privileges to run. Please try again with sudo."
	exit 1
fi

# The script can be passed a json file as its first argument to allow for more
# customization options
if [[ ${1: -5} == ".json" ]]; then FILE=$1; fi

# Take the arguments passed to the script and convert them into something that
# the jq function can use.
SEARCH_ARGS_STRING=$(echo ${@:2} | tr ' ' '\n' \
	| awk 'NR==1 { printf ".name==\"%s\"", $0 } NR>1 { printf " or .name==\"%s\"", $0 }')

# For each of the apps listed in the json file, delete all the files at the
# specified paths
jq ".apps[] | select($SEARCH_ARGS_STRING)" $FILE | jq ".paths[]"\
	| while read path
	do
		echo $path | tr ' ' '\ ' | xargs rm -rf
	done