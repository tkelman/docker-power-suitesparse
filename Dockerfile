FROM debian:unstable

#FROM staticfloat/julia_workerbase_debian8_6:ppc64le
# (oops that image is for running on an actual power system, not a cross-compiler)

#curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add - && \
#echo 'deb http://emdebian.org/tools/debian/ jessie main' > /etc/apt/sources.list.d/crosstools.list && \
#apt-get update && \

WORKDIR /home/test
ADD mwe.c .
ADD build.sh .
ENV CC powerpc64le-linux-gnu-gcc
RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user creduce libopenblas-base:ppc64el \
libc6:ppc64el libz-dev:ppc64el curl ca-certificates crossbuild-essential-ppc64el && \
./build.sh && mv SuiteSparse/*.i . && rm -rf mwe-O2 mwe-O3 SuiteSparse *.tar.gz
ADD test.sh .
RUN creduce --debug --timing test.sh *.i
#RUN qemu-ppc64le ./mwe-O2 && echo $? && \
#qemu-ppc64le ./mwe-O3 && echo $?
