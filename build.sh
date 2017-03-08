#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -DFIXQ -c UMFPACK/Source/umf_assemble.c -o umf_zl_assemble_fixq.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -DDROP -c UMFPACK/Source/umf_store_lu.c -o umf_zl_store_lu_drop.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_assemble.c -o umf_zl_assemble.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_blas3_update.c -o umf_zl_blas3_update.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_build_tuples.c -o umf_zl_build_tuples.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_create_element.c -o umf_zl_create_element.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_extend_front.c -o umf_zl_extend_front.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_garbage_collection.c -o umf_zl_garbage_collection.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_get_memory.c -o umf_zl_get_memory.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_init_front.c -o umf_zl_init_front.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel.c -o umf_zl_kernel.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel_init.c -o umf_zl_kernel_init.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_kernel_wrapup.c -o umf_zl_kernel_wrapup.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_local_search.c -o umf_zl_local_search.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_element.c -o umf_zl_mem_alloc_element.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_head_block.c -o umf_zl_mem_alloc_head_block.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_alloc_tail_block.c -o umf_zl_mem_alloc_tail_block.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_free_tail_block.c -o umf_zl_mem_free_tail_block.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_mem_init_memoryspace.c -o umf_zl_mem_init_memoryspace.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_row_search.c -o umf_zl_row_search.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_scale_column.c -o umf_zl_scale_column.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_set_stats.c -o umf_zl_set_stats.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_symbolic_usage.c -o umf_zl_symbolic_usage.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_transpose.c -o umf_zl_transpose.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_tuple_lengths.c -o umf_zl_tuple_lengths.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_valid_symbolic.c -o umf_zl_valid_symbolic.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_grow_front.c -o umf_zl_grow_front.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_start_front.c -o umf_zl_start_front.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_store_lu.c -o umf_zl_store_lu.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umf_scale.c -o umf_zl_scale.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_free_numeric.c -o umfpack_zl_free_numeric.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_free_symbolic.c -o umfpack_zl_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_numeric.c -o umfpack_zl_numeric.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_qsymbolic.c -o umfpack_zl_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DZLONG -c UMFPACK/Source/umfpack_symbolic.c -o umfpack_zl_symbolic.o
gcc -O3 -o ../mwe ../mwe.c \
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
UMFPACK/Source/umfpack_tictoc.c \
umf_zl_assemble_fixq.o umf_zl_store_lu_drop.o umf_zl_assemble.o umf_zl_blas3_update.o umf_zl_build_tuples.o umf_zl_create_element.o \
umf_zl_extend_front.o umf_zl_garbage_collection.o umf_zl_get_memory.o umf_zl_init_front.o umf_zl_kernel.o umf_zl_kernel_init.o umf_zl_kernel_wrapup.o umf_zl_local_search.o umf_zl_mem_alloc_element.o umf_zl_mem_alloc_head_block.o umf_zl_mem_alloc_tail_block.o umf_zl_mem_free_tail_block.o umf_zl_mem_init_memoryspace.o \
umf_zl_row_search.o umf_zl_scale_column.o umf_zl_set_stats.o umf_zl_symbolic_usage.o umf_zl_transpose.o umf_zl_tuple_lengths.o \
umf_zl_valid_symbolic.o umf_zl_grow_front.o umf_zl_start_front.o umf_zl_store_lu.o umf_zl_scale.o \
umfpack_zl_free_numeric.o umfpack_zl_free_symbolic.o umfpack_zl_numeric.o umfpack_zl_qsymbolic.o umfpack_zl_symbolic.o \
-lm -L../../usr/lib -lopenblas -Wl,-rpath=$PWD/../../usr/lib
