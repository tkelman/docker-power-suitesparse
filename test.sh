#!/bin/bash -e
gcc -O2 -o mwe-O2-native *.i $CFLAGS -fexceptions -fPIC -lm /home/test/libopenblas.so.0 -Wl,-rpath=/home/test
timeout 20 ./mwe-O2-native
$CC -O2 -o mwe-O2 *.i $CFLAGS -fexceptions -fPIC -lm /usr/lib/libblas.so.3 &
$CC -O3 -o mwe-O3 *.i $CFLAGS -fexceptions -fPIC -lm /usr/lib/libblas.so.3 &
wait %1
timeout 20 qemu-ppc64le ./mwe-O2 2>/dev/null
wait %2
! timeout 20 qemu-ppc64le ./mwe-O3 2>/dev/null
