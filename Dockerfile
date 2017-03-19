FROM debian:unstable
WORKDIR /home/test
RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user curl git \
build-essential ca-certificates crossbuild-essential-ppc64el \
libc6:ppc64el libgomp1:ppc64el
ENV CC powerpc64le-linux-gnu-gcc
ADD mwe.c .
ADD build.sh .
ADD test.sh .
RUN git clone https://github.com/xianyi/OpenBLAS && \
sed -i 's|./getarch|qemu-ppc64le ./getarch|g' OpenBLAS/Makefile.prebuild
RUN cd OpenBLAS && git bisect start && git bisect new && \
git checkout v0.2.19 && ../test.sh && git bisect old && git bisect run ../test.sh


#RUN mkdir -p ../usr/lib && cd OpenBLAS && make TARGET=POWER8 -j8 && \
#cp *.so ../../usr/lib && cp libopenblas.so ../../usr/lib/libopenblas.so.0
#RUN ./build.sh
#RUN qemu-ppc64le ./mwe-O2
#RUN qemu-ppc64le ./mwe-O3
