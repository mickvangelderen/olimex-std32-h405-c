#!/usr/bin/env bash

TOOLCHAIN_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2?revision=375265d4-e9b5-41c8-bf23-56cbe927e156?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2017-q4-major
TOOLCHAIN_FILENAME=gcc-arm-none-eabi-7-2017-q4-major.tar.bz2
TOOLCHAIN_DIRNAME=gcc-arm-none-eabi-7-2017-q4-major

if [ ! -f "$TOOLCHAIN_FILENAME" ]; then
	wget "$TOOLCHAIN_URL" -O "$TOOLCHAIN_FILENAME"
fi

if [ ! -d "$TOOLCHAIN_DIRNAME" ]; then
	tar xjf "$TOOLCHAIN_FILENAME"
fi

