#!/bin/bash -e
make clean
make TARGET=POWER8 -j8
mkdir -p ../../usr/lib
cp *.so ../../usr/lib
cp libopenblas.so ../../usr/lib/libopenblas.so.0
cd ..
./build.sh
cd OpenBLAS
qemu-ppc64le ../mwe-O2
! qemu-ppc64le ../mwe-O3
