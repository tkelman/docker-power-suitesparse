FROM debian:unstable

#curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add - && \
#echo 'deb http://emdebian.org/tools/debian/ jessie main' > /etc/apt/sources.list.d/crosstools.list && \
#apt-get update && \

RUN dpkg --add-architecture ppc64el && \
apt-get update && \
apt-get install -y --no-install-recommends qemu-user libblas3:ppc64el \
libc6:ppc64el libz-dev:ppc64el curl ca-certificates crossbuild-essential-ppc64el
ADD build.sh .
ADD mwe.c .
RUN CC=powerpc64le-linux-gnu-gcc ./build.sh
RUN cp /usr/powerpc64le-linux-gnu/lib/* . && \
export QEMU_CPU=POWER8 && \
qemu-ppc64le ./mwe-O2 && echo $? && \
qemu-ppc64le ./mwe-O3 && echo $?



# && \
#export QEMU_CPU=POWER8 && \
#qemu-ppc64le ~/julia-*/bin/julia -E ' \
#tmp = Array{Ptr{Void}}(1); \
#ccall((:umfpack_zl_symbolic, :libumfpack), Int64, \
#        (Int64, Int64, Ptr{Int64}, Ptr{Int64}, Ptr{Float64}, Ptr{Float64}, Ptr{Void}, Ptr{Float64}, Ptr{Float64}), \
#         20, 20, colptr, rowval, realval, imagval, tmp, umf_ctrl, umf_info); \
#symbolic = tmp[1]; \
#tmp = Array{Ptr{Void}}(1); \
#status = ccall((:umfpack_zl_numeric, :libumfpack), Int64, \
#        (Ptr{Int64}, Ptr{Int64}, Ptr{Float64}, Ptr{Float64}, Ptr{Void}, Ptr{Void}, Ptr{Float64}, Ptr{Float64}), \
#         colptr, rowval, realval, imagval, symbolic, tmp, umf_ctrl, umf_info) \
#'
