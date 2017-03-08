#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe mwe-O2 mwe-O3
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse
if [ -e /usr/lib/libblas.so.3 ]; then
BLAS=/usr/lib/libblas.so.3
else
BLAS="-L../../usr/lib -lopenblas -Wl,-rpath=$PWD/../../usr/lib"
fi
if [ -z "$CC" ]; then
CC=gcc
fi
rm -f *.o *.s
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -DFIXQ -c UMFPACK/Source/umf_assemble.c -o umf_zl_assemble_fixq.o
mv umf_assemble.i umf_zl_assemble_fixq.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -DDROP -c UMFPACK/Source/umf_store_lu.c -o umf_zl_store_lu_drop.o
mv umf_store_lu.i umf_zl_store_lu_drop.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_assemble.c -o umf_zl_assemble.o
mv umf_assemble.i umf_zl_assemble.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_blas3_update.c -o umf_zl_blas3_update.o
mv umf_blas3_update.i umf_zl_blas3_update.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_build_tuples.c -o umf_zl_build_tuples.o
mv umf_build_tuples.i umf_zl_build_tuples.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_create_element.c -o umf_zl_create_element.o
mv umf_create_element.i umf_zl_create_element.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_extend_front.c -o umf_zl_extend_front.o
mv umf_extend_front.i umf_zl_extend_front.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_garbage_collection.c -o umf_zl_garbage_collection.o
mv umf_garbage_collection.i umf_zl_garbage_collection.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_get_memory.c -o umf_zl_get_memory.o
mv umf_get_memory.i umf_zl_get_memory.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_init_front.c -o umf_zl_init_front.o
mv umf_init_front.i umf_zl_init_front.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel.c -o umf_zl_kernel.o
mv umf_kernel.i umf_zl_kernel.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel_init.c -o umf_zl_kernel_init.o
mv umf_kernel_init.i umf_zl_kernel_init.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel_wrapup.c -o umf_zl_kernel_wrapup.o
mv umf_kernel_wrapup.i umf_zl_kernel_wrapup.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_local_search.c -o umf_zl_local_search.o
mv umf_local_search.i umf_zl_local_search.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_element.c -o umf_zl_mem_alloc_element.o
mv umf_mem_alloc_element.i umf_zl_mem_alloc_element.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_head_block.c -o umf_zl_mem_alloc_head_block.o
mv umf_mem_alloc_head_block.i umf_zl_mem_alloc_head_block.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_tail_block.c -o umf_zl_mem_alloc_tail_block.o
mv umf_mem_alloc_tail_block.i umf_zl_mem_alloc_tail_block.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_free_tail_block.c -o umf_zl_mem_free_tail_block.o
mv umf_mem_free_tail_block.i umf_zl_mem_free_tail_block.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_init_memoryspace.c -o umf_zl_mem_init_memoryspace.o
mv umf_mem_init_memoryspace.i umf_zl_mem_init_memoryspace.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_row_search.c -o umf_zl_row_search.o
mv umf_row_search.i umf_zl_row_search.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_scale_column.c -o umf_zl_scale_column.o
mv umf_scale_column.i umf_zl_scale_column.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_set_stats.c -o umf_zl_set_stats.o
mv umf_set_stats.i umf_zl_set_stats.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_symbolic_usage.c -o umf_zl_symbolic_usage.o
mv umf_symbolic_usage.i umf_zl_symbolic_usage.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_transpose.c -o umf_zl_transpose.o
mv umf_transpose.i umf_zl_transpose.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_tuple_lengths.c -o umf_zl_tuple_lengths.o
mv umf_tuple_lengths.i umf_zl_tuple_lengths.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_valid_symbolic.c -o umf_zl_valid_symbolic.o
mv umf_valid_symbolic.i umf_zl_valid_symbolic.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_grow_front.c -o umf_zl_grow_front.o
mv umf_grow_front.i umf_zl_grow_front.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_start_front.c -o umf_zl_start_front.o
mv umf_start_front.i umf_zl_start_front.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_store_lu.c -o umf_zl_store_lu.o
mv umf_store_lu.i umf_zl_store_lu.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_scale.c -o umf_zl_scale.o
mv umf_scale.i umf_zl_scale.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_free_numeric.c -o umfpack_zl_free_numeric.o
mv umfpack_free_numeric.i umfpack_zl_free_numeric.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_free_symbolic.c -o umfpack_zl_free_symbolic.o
mv umfpack_free_symbolic.i umfpack_zl_free_symbolic.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_numeric.c -o umfpack_zl_numeric.o
mv umfpack_numeric.i umfpack_zl_numeric.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_qsymbolic.c -o umfpack_zl_qsymbolic.o
mv umfpack_qsymbolic.i umfpack_zl_qsymbolic.i
$CC -save-temps -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_symbolic.c -o umfpack_zl_symbolic.o
mv umfpack_symbolic.i umfpack_zl_symbolic.i
$CC -save-temps -c \
-fexceptions -fPIC SuiteSparse_config/SuiteSparse_config.c \
-ICOLAMD/Include -ISuiteSparse_config COLAMD/Source/colamd.c -DDLONG \
-IAMD/Include AMD/Source/amd_aat.c \
AMD/Source/amd_2.c \
AMD/Source/amd_postorder.c \
AMD/Source/amd_post_tree.c \
AMD/Source/amd_defaults.c \
AMD/Source/amd_valid.c \
-DNPARTITION -IAMD/Source -ICHOLMOD/Include \
CHOLMOD/Core/cholmod_aat.c \
CHOLMOD/Core/cholmod_band.c \
CHOLMOD/Core/cholmod_change_factor.c \
CHOLMOD/Core/cholmod_common.c \
CHOLMOD/Core/cholmod_copy.c \
CHOLMOD/Core/cholmod_error.c \
CHOLMOD/Core/cholmod_factor.c \
CHOLMOD/Core/cholmod_memory.c \
CHOLMOD/Core/cholmod_sparse.c \
CHOLMOD/Core/cholmod_transpose.c \
CHOLMOD/Check/cholmod_check.c \
CHOLMOD/Cholesky/cholmod_amd.c \
CHOLMOD/Cholesky/cholmod_analyze.c \
CHOLMOD/Cholesky/cholmod_colamd.c \
CHOLMOD/Cholesky/cholmod_etree.c \
CHOLMOD/Cholesky/cholmod_postorder.c \
CHOLMOD/Cholesky/cholmod_rowcolcounts.c \
CHOLMOD/Supernodal/cholmod_super_symbolic.c \
-IUMFPACK/Include -IUMFPACK/Source \
UMFPACK/Source/umf_analyze.c \
UMFPACK/Source/umf_apply_order.c \
UMFPACK/Source/umf_colamd.c \
UMFPACK/Source/umf_free.c \
UMFPACK/Source/umf_fsize.c \
UMFPACK/Source/umf_is_permutation.c \
UMFPACK/Source/umf_malloc.c \
UMFPACK/Source/umf_realloc.c \
UMFPACK/Source/umf_singletons.c \
UMFPACK/Source/umf_cholmod.c \
UMFPACK/Source/umfpack_tictoc.c
rm -f *.o *.s
for opt in O2 O3; do
$CC -$opt -o ../mwe-$opt ../mwe.c \
-fexceptions -fPIC *.i -lm $BLAS
#../blas/lsame.c ../blas/zgemm.c ../blas/zgemv.c ../blas/zgeru.c \
#../blas/ztrsm.c ../blas/ztrsv.c ../blas/xerbla.c \
#-I../libf2c ../libf2c/close.c ../libf2c/d_cnjg.c ../libf2c/endfile.c \
#../libf2c/err.c ../libf2c/open.c ../libf2c/s_stop.c ../libf2c/sig_die.c \
#../libf2c/util.c ../libf2c/z_div.c
done
