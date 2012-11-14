#!/bin/sh
echo "removing old patches..."
rm ../../../../frameworks/native/*.patch
rm ../../../../hardware/ril/*.patch
rm ../../../../hardware/qcom/display/*.patch
rm ../../../../external/wpa_supplicant_6/*.patch

echo
echo "Copying files..."
cp frameworks_native* ../../../../frameworks/native/
cp hardware_ril* ../../../../hardware/ril/
cp hardware_qcom_display* ../../../../hardware/qcom/display/
cp external_wpa_supplicant_6* ../../../../external/wpa_supplicant_6/
echo

echo "cd frameworks/native"
cd ../../../../frameworks/native/
echo "apply patch"
git am *.patch
echo

echo "cd hardware/ril"
cd ../../hardware/ril/
echo "apply patch"
git am *.patch
echo

echo "cd hardware/qcom/display/"
cd ../../hardware/qcom/display/
echo "apply patch"
git am *.patch
echo

echo "cd external/wpa_supplicant_6/"
cd ../../../external/wpa_supplicant_6/
echo "apply patch"
git am *.patch
echo

cd ../../
