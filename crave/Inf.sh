# Rom repo init

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault

echo "-----------------------------"
echo "Repo init cloned successfully"
echo "-----------------------------"

# sycning

echo "-----------------------"
echo "Starting to sync source"
echo "-----------------------"

/opt/crave/resync.sh

/opt/crave/resync.sh

/opt/crave/resync.sh

echo "------------------------"
echo "Source syncing comppeted"
echo "------------------------"


# Dt

git clone https://github.com/Termuxtest1-Lisa/device_xiaomi_lisa-new -b Inf device/xiaomi/lisa
git clone https://github.com/Termuxtest1-Lisa/device_xiaomi_sm8350-common-new -b Inf device/xiaomi/sm8350-common
git clone https://github.com/Termuxtest1-Lisa/Kernel_xiaomi_lisa -b lifesteal_clean kernel/xiaomi/lisa
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git hardware/sony/timekeep 
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi 
git clone https://github.com/Termuxtest1-Lisa/proprietary_vendor_xiaomi_sm8350-common vendor/xiaomi/sm8350-common
git clone https://github.com/Termuxtest1-Lisa/proprietary_vendor_xiaomi_lisa vendor/xiaomi/lisa
git clone  https://gitlab.com/itsvixano-dev/android/miuicamera/proprietary_vendor_xiaomi_miuicamera-lisa/ -b lineage-23.2 vendor/xiaomi/miuicamera-lisa
git clone https://github.com/swiitch-OFF-Lab/hardware_dolby -b sony-1.5  hardware/dolby
git clone https://github.com/swiitch-OFF-Lab/packages_apps_DolbyUI -b 16.0 packages/apps/DolbyUI
git clone https://github.com/elpaablo/packages_apps_ViPER4AndroidFX/ -b alpha-16.1 packages/apps/ViPER4AndroidFX

echo "---------------------"
echo "Tress clone completed"
echo "---------------------"

# build env

. b*/e*

echo "---------------------------"
echo "Build/envsetup.sh completed"
echo "---------------------------"

# signing script

git clone https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys-template vendor/infinity-priv/keys
cd vendor/infinity-priv/keys
./keys.sh
cd ../../..

echo "----------------------------"
echo "Rom signed with private keys"
echo "----------------------------"

# build

lunch infinity_lisa-user

mka bacon

echo "----------"
echo "Done"
echo "----------"
