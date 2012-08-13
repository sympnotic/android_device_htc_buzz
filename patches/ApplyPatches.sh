#!/bin/sh
echo "removing old patches..."
rm ../../../../bionic/*.patch
rm ../../../../frameworks/native/*.patch
rm ../../../../frameworks/av/*.patch
rm ../../../../hardware/ril/*.patch
echo
echo "Copying files..."
cp android_bionic* ../../../../bionic/
cp frameworks_native* ../../../../frameworks/native/
cp frameworks_av* ../../../../frameworks/av/
cp hardware_ril* ../../../../hardware/ril/
echo

echo "cd bionic"
cd ../../../../bionic/
echo "apply patch"
git am *.patch
echo

echo "cd frameworks/native"
cd ../frameworks/native/
echo "apply patch"
git am *.patch
echo

echo "cd frameworks/av"
cd ../../frameworks/av/
echo "apply patch"
git am *.patch
echo

echo "cd hardware/ril"
cd ../../hardware/ril/
echo "apply patch"
git am *.patch
echo
cd ../../
