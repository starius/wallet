#! /usr/bin/env nix-shell
#!nix-shell -i bash -p androidsdk_9_0 -p apksigner
SDK_DERIVATION=/nix/store/wzxdnnl0kkc4n8gkx8z3lx9fjdcsqxxm-androidsdk
rm app/build/outputs/apk/release/StandardSats-SBW-2.4.21-aligned.apk || true
$SDK_DERIVATION/libexec/android-sdk/build-tools/31.0.0/zipalign -v 4 app/build/outputs/apk/release/StandardSats-SBW-2.4.21.apk app/build/outputs/apk/release/StandardSats-SBW-2.4.21-aligned.apk
apksigner sign --ks sbw.keystore --ks-key-alias sbw --v1-signing-enabled true --v2-signing-enabled true app/build/outputs/apk/release/StandardSats-SBW-2.4.21-aligned.apk
