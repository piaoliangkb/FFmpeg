export API_LEVEL=28
export AOSP_API=android-$API_LEVEL
export BUILD_PLATFORM=darwin
# export BUILD_PLATFORM=linux
export TOOLCHAIN=$ANDROID_NDK/toolchains/llvm/prebuilt/$BUILD_PLATFORM-x86_64
export SYSROOT=$TOOLCHAIN/sysroot
export HOST=aarch64-linux-android
export CROSS_PREFIX_BUILD_TOOL_PATH=$HOST$API_LEVEL-
export CPU=arm64-v8a
export ARCH=arm64
export ADDI_CFLAGS="-march=armv8-a"
export CROSS_COMPILE=$TOOLCHAIN/bin/$CROSS_PREFIX_BUILD_TOOL_PATH

./configure \
  --enable-cross-compile \
  --prefix=. \
  --disable-shared \
  --enable-static \
  --enable-protocol=concat \
  --enable-protocol=file \
  --enable-muxer=mp4 \
  --enable-demuxer=mpegts \
  --disable-stripping \
  --cross-prefix="$TOOLCHAIN"/bin/ \
  --target-os=android \
  --arch=$ARCH \
  --cc="$CROSS_COMPILE"clang \
  --nm="$TOOLCHAIN"/bin/llvm-nm \
	--ar="$TOOLCHAIN"/bin/llvm-ar \
  --ranlib="$TOOLCHAIN"/bin/llvm-ranlib \
  --pkg-config="pkg-config" \
  --sysroot="$SYSROOT" \
  --enable-jni \
  --enable-mediacodec \
  --enable-decoder=h264_mediacodec \
  --enable-decoder=hevc_mediacodec \
  --enable-decoder=mpeg4_mediacodec \
  --enable-debug=3 \
  --disable-optimizations \
  --disable-stripping \
  --extra-cflags="$ADDI_CFLAGS"
