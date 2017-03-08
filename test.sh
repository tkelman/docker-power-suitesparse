#!/bin/bash -e
$CC -O2 -o mwe-O2 SuiteSparse/*.i -fexceptions -fPIC -lm -L../usr/lib -lopenblas -Wl,-rpath=$PWD/../usr/lib
timeout 20 qemu-ppc64le ./mwe-O2
$CC -O3 -o mwe-O2 SuiteSparse/*.i -fexceptions -fPIC -lm -L../usr/lib -lopenblas -Wl,-rpath=$PWD/../usr/lib
! timeout 20 qemu-ppc64le ./mwe-O3
