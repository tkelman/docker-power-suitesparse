#!/bin/bash -e
$CC -O2 -o mwe-O2 *.i -fexceptions -fPIC -lm /usr/lib/libblas.so.3
timeout 20 qemu-ppc64le ./mwe-O2
$CC -O3 -o mwe-O2 *.i -fexceptions -fPIC -lm /usr/lib/libblas.so.3
! timeout 20 qemu-ppc64le ./mwe-O3
