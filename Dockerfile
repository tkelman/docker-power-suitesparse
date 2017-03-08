FROM debian:unstable

#FROM staticfloat/julia_workerbase_debian8_6:ppc64le
# (oops that image is for running on an actual power system, not a cross-compiler)

#curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add - && \
#echo 'deb http://emdebian.org/tools/debian/ jessie main' > /etc/apt/sources.list.d/crosstools.list && \
#apt-get update && \

WORKDIR /root
#libblas3:ppc64el \
RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user \
libc6:ppc64el libz-dev:ppc64el curl ca-certificates crossbuild-essential-ppc64el && \
mkdir -p ../usr/lib && cp /usr/powerpc64le-linux-gnu/lib/* ../usr/lib && \
curl -L https://s3.amazonaws.com/julialang/bin/linux/ppc64le/0.6/julia-0.6.0-pre.alpha-linux-ppc64le.tar.gz | \
tar -xzf - && cp julia-*/lib/julia/* ../usr/lib && rm -rf julia-*
ADD mwe.c .
ADD build.sh .
RUN CC=powerpc64le-linux-gnu-gcc ./build.sh
RUN export QEMU_CPU=POWER8 && \
qemu-ppc64le ./mwe-O2 && echo $? && \
qemu-ppc64le ./mwe-O3 && echo $?
