#!/bin/sh
echo "removing old patches..."
rm ../../../../packages/apps/Trebuchet/*.patch

echo
echo "Copying files..."
cp packages_apps_Trebuchet* ../../../../packages/apps/Trebuchet/
echo

echo "cd packages/apps/Trebuchet"
cd ../../../../packages/apps/Trebuchet/
echo "apply patch"
git am *.patch
echo

cd ../../../
