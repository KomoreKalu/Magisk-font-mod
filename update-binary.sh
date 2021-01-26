#!/bin/bash
set -e
IFS_TMP=$IFS
IFS=$'\n'

curl -OS https://cdn.jsdelivr.net/gh/topjohnwu/Magisk/scripts/module_installer.sh

if [ ${#} -eq 0 ]; then
	for pkg in $(ls | grep '.*.zip$')
	do
		unzip -o "$pkg" META-INF/com/google/android/update-binary -d .
		cat module_installer.sh > ./META-INF/com/google/android/update-binary
		zip "$pkg" META-INF/com/google/android/update-binary
		echo "$pkg" update successfully
	done
else
	for pkg in "$@"
	do
		unzip -o "$pkg" META-INF/com/google/android/update-binary -d .
		cat module_installer.sh > ./META-INF/com/google/android/update-binary
		zip "$pkg" META-INF/com/google/android/update-binary
		echo "$pkg" update successfully
	done
fi	

rm -rf META-INF module_installer.sh

IFS=$IFS_TMP
