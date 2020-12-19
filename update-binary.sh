#!/bin/bash

unzip $1 META-INF/com/google/android/update-binary -d .
sh -c 'wget -c https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh -O - | cat - > ./META-INF/com/google/android/update-binary'
zip $1 META-INF/com/google/android/update-binary
rm -rf META-INF/
