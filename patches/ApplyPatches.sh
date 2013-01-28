#!/bin/sh
echo "removing old patches..."
rm ../../../../frameworks/native/*.patch
rm ../../../../frameworks/base/*.patch
rm ../../../../frameworks/opt/telephony/*.patch
rm ../../../../hardware/ril/*.patch
rm ../../../../hardware/qcom/display/*.patch
rm ../../../../external/wpa_supplicant_6/*.patch
rm ../../../../packages/inputmethods/LatinIME/*.patch
rm ../../../../vendor/cm/*.patch

echo
echo "Copying files..."
cp frameworks_native* ../../../../frameworks/native/
cp frameworks_base* ../../../../frameworks/base/
cp frameworks_opt_telephony* ../../../../frameworks/opt/telephony/
cp hardware_ril* ../../../../hardware/ril/
cp hardware_qcom_display* ../../../../hardware/qcom/display/
cp external_wpa_supplicant_6* ../../../../external/wpa_supplicant_6/
cp packages_inputmethods_LatinIME* ../../../../packages/inputmethods/LatinIME/
cp vendor_cm* ../../../../vendor/cm/
echo

echo "cd frameworks/native/"
cd ../../../../frameworks/native/
echo "apply patch"
git am *.patch
echo

echo "cd frameworks/base/"
cd ../../frameworks/base/
echo "apply patch"
git am *.patch
echo

echo "cd frameworks/opt/telephony"
cd ../../frameworks/opt/telephony/
echo "apply patch"
git am *.patch
echo

echo "cd hardware/ril"
cd ../../../hardware/ril/
echo "apply patch"
git am *.patch
echo

echo "gralloc patch is disabled"
cd ../../hardware/qcom/display/
echo "apply patch"
git am *.patch
echo

echo "cd external/wpa_supplicant_6/"
cd ../../../external/wpa_supplicant_6/
echo "apply patch"
git am *.patch
echo

echo "cd packages/inputmethods/LatinIME/"
cd ../../packages/inputmethods/LatinIME/
echo "apply patch"
git am *.patch
echo

echo "cd vendor/cm/"
cd ../../../vendor/cm/
echo "apply patch"
git am *.patch
echo

cd ../../
