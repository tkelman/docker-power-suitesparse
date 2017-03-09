FROM debian:unstable
WORKDIR /home/test
ENV CC powerpc64le-linux-gnu-gcc
ADD mwe.c .
ADD build.sh .
ADD test.sh .
RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user creduce libopenblas-base:ppc64el \
libc6:ppc64el libz-dev:ppc64el curl ca-certificates crossbuild-essential-ppc64el && \
./build.sh && mv SuiteSparse/*.i . && rm -rf mwe-O2 mwe-O3 SuiteSparse *.tar.gz
RUN creduce --debug --timing test.sh *.i
#RUN qemu-ppc64le ./mwe-O2 && echo $? && \
#qemu-ppc64le ./mwe-O3 && echo $?
