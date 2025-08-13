#!/usr/bin/env bash
# build-apk.sh - one-command debug APK build
# Usage:
#   ./build-apk.sh
set -euo pipefail

echo "Installing npm dependencies..."
npm install

echo "Generating Android project..."
npx cap add android >/dev/null 2>&1 || true
npx cap copy

echo "Building debug APK..."
cd android
./gradlew assembleDebug

APK="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK" ]; then
  echo "APK built: $(pwd)/$APK"
else
  echo "ERROR: APK not found. See Gradle output above." >&2
  exit 1
fi
