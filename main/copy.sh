#!/bin/zsh

bazel build -c dbg --config=darwin_arm64 main:libmediapipe.dylib --sandbox_debug
rm -f /Users/yangyudong/Desktop/mediapipe/mediapipe/libmediapipe.dylib
cp bazel-bin/main/libmediapipe.dylib_lipobin /Users/yangyudong/Desktop/mediapipe/mediapipe/libmediapipe.dylib
cd /Users/yangyudong/Desktop/mediapipe/mediapipe
install_name_tool -id "@rpath/libmediapipe.dylib" libmediapipe.dylib