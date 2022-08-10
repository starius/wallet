#! /usr/bin/env nix-shell
#!nix-shell -i bash -p androidsdk_9_0 -p apksigner
set -xe
echo $PATH
SDK_DERIVATION=/nix/store/w1259lpbs1wg39ji71hbyvvq7q8d3ac4-build-tools-31.0.0
rm app/build/outputs/bundle/release/app-release-aligned.aab || true
$SDK_DERIVATION/libexec/android-sdk/build-tools/31.0.0/zipalign -v 4 app/build/outputs/bundle/release/app-release.aab app/build/outputs/bundle/release/app-release-aligned.aab
apksigner sign --ks release.keystore --ks-key-alias release --v1-signing-enabled true --v2-signing-enabled true --min-sdk-version 30 app/build/outputs/bundle/release/app-release-aligned.aab
