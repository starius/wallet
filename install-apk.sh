#! /usr/bin/env nix-shell
#!nix-shell -i bash -p androidenv.androidPkgs_9_0.platform-tools
echo "Devices"
adb devices
#adb -d uninstall com.btcontract.wallet
adb -d install -r ./app/build/outputs/apk/debug/valet-2.4.19.apk
