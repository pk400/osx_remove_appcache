#! /bin/bash

mkdir "/Library/Application Support/testfolder1" 2>/dev/null
mkdir "/Library/PrivilegedHelperTools/testfolder2" 2>/dev/null
mkdir "~/Library/Application Support/testfolder3" 2>/dev/null

touch "/Library/Application Support/testfolder1/file1" 2>/dev/null
touch "~/Library/Application Support/testfolder3/file2" 2>/dev/null

./rmcache test.json