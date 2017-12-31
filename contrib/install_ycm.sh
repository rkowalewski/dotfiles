#!/bin/sh

# For instructions, see http://valloric.github.io/YouCompleteMe/#full-installation-guide
# We assume here that you have your own LLVM build from source (version >= 3.9)

if ! type clang > /dev/null 2>&1;
then
  echo 'clang is not installed or in $PATH';
fi

CLANG_VERSION="$(clang --version | head -n 1 | sed 's/\(^.*\)\([0-9]\.[0-9]\.[0-9]\)\(.*\)/\2/' | sed 's/\.//g')"

if [ ! $CLANG_VERSION -ge 400 ];
then
  echo "ycm requires clang >= 4.0.0"
  exit 1
fi

# Update all
cd ~/.vim/plugged/YouCompleteMe
#git submodule update --init --recursive

BUILD_DIR="$(mktemp -d /tmp/build_ycm.XXXX)"

CLANG_LIB="$(clang --version | tail -n 1 | cut -d ':' -f 2 | xargs -L1 echo)/../lib/libclang.so"

if [ ! -f $CLANG_LIB ];
then
  echo "cannot find clang"
  exit 1
fi


# Generate Makefiles
cd $BUILD_DIR
echo "Generating Makefiles..."
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=$CLANG_LIB . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
echo "Makefiles have been written to $BUILD_DIR."

# Build YCM
echo "Building ycm..."
cmake --build . --target ycm_core --config Release
echo "Done..."

rm -rf "$BUILD_DIR"

