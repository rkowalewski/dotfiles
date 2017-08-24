#!/bin/sh

# For instructions, see http://valloric.github.io/YouCompleteMe/#full-installation-guide
# We assume here that you have your own LLVM build from source (version >= 3.9)

echo "INSTALLING YouCompleteMe"

[[ -n "$HOME" ]] && echo "Error" && exit 1

SCRIPT_DIR=$(dirname $0 || exit $?)

git submodule update --init --recursive

BUILD_DIR="$HOME/tmp/ycm_build"
CLANG_LIB="/opt/clang-toolchain/llvm/lib/libclang.so"

mkdir -p $BUILD_DIR

# Generate Makefiles
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=$CLANG_LIB $BUILD_DIR $SCRIPT_DIR/YouCompleteMe/third_party/ycmd/cpp

# Build YCM
cmake --build $BUILD_DIR --target ycm_core --config Release

