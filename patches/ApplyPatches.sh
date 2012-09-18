#!/bin/sh
echo "removing old patches..."
rm ../../../../frameworks/native/*.patch
rm ../../../../hardware/ril/*.patch
rm ../../../../hardware/msm7k/*.patch
rm ../../../../hardware/qcom/display/*.patch
echo
echo "Copying files..."
cp frameworks_native* ../../../../frameworks/native/
cp hardware_ril* ../../../../hardware/ril/
cp hardware_msm7k* ../../../../hardware/msm7k/
cp hardware_qcom_display* ../../../../hardware/qcom/display/
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

echo "cd hardware/msm7k"
cd ../../hardware/msm7k/
echo "apply patch"
git am *.patch
echo

echo "cd hardware/qcom/display/"
cd ../../hardware/qcom/display/
echo "apply patch"
git am *.patch
echo
cd ../../../
