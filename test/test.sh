#! /bin/bash

mkdir -p "/Library/Application Support/testfolder1"
mkdir -p "/Library/PrivilegedHelperTools/testfolder2"
mkdir -p "~/Library/Application Support/testfolder3"

touch "/Library/Application Support/testfolder1/file1"
touch "~/Library/Application Support/testfolder3/file2"

../rmcache.sh ../json/test.json TestApp