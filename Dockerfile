FROM debian:unstable
WORKDIR /home/test
ENV CC powerpc64le-linux-gnu-gcc
ADD mwe.c .
ADD build.sh .
ADD test.sh .
RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user creduce libopenblas-base \
libc6:ppc64el build-essential curl ca-certificates crossbuild-essential-ppc64el && \
cp /usr/lib/libopenblas* . && apt-get install -y libopenblas-base:ppc64el && \
./build.sh && mv SuiteSparse/*.i . && rm -rf mwe-O2 mwe-O3 SuiteSparse *.tar.gz && \
./test.sh && CFLAGS="-w -fno-diagnostics-show-caret" creduce --n `nproc` \
--debug --timing test.sh *.i && ./test.sh
