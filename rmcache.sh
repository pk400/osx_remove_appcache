#! /bin/bash

# Check if Homebrew is installed
brew -v > /dev/null
if [[ $? -ne 0 ]]; then echo "Homebrew not installed."; exit 2; fi

# Look for JSON objects on the arguments passed to script
FILE="paths.json"
SEARCH_ARGS_STRING=$(echo $@ | tr ' ' '\n' | awk 'NR==1 { printf ".name==\"%s\"", $0 } NR>1 { printf " or .name==\"%s\"", $0 }')
QUERY=$(jq ".apps[] | select($SEARCH_ARGS_STRING)" $FILE)

# Delete paths in each object
echo "$QUERY" | jq -r ".paths[]" | while read path; do rm -r "$path"; done