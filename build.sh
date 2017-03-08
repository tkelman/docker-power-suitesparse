#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse
gcc -O3 -fexceptions -fPIC -IAMD/Include -ICOLAMD/Include -ISuiteSparse_config \
-ICHOLMOD/Include -IUMFPACK/Include -DNPARTITION -DDLONG -DZLONG \
SuiteSparse_config/SuiteSparse_config.c \
AMD/Source/amd_aat.c \
AMD/Source/amd_2.c \
AMD/Source/amd_postorder.c \
AMD/Source/amd_post_tree.c \
AMD/Source/amd_defaults.c \
AMD/Source/amd_valid.c \
COLAMD/Source/colamd.c \
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
UMFPACK/Source/umf_assemble.c \
UMFPACK/Source/umf_store_lu.c \
UMFPACK/Source/umf_assemble.c \
UMFPACK/Source/umf_blas3_update.c \
UMFPACK/Source/umf_build_tuples.c \
UMFPACK/Source/umf_create_element.c \
UMFPACK/Source/umf_extend_front.c \
UMFPACK/Source/umf_garbage_collection.c \
UMFPACK/Source/umf_get_memory.c \
UMFPACK/Source/umf_init_front.c \
UMFPACK/Source/umf_kernel.c \
UMFPACK/Source/umf_kernel_init.c \
UMFPACK/Source/umf_kernel_wrapup.c \
UMFPACK/Source/umf_local_search.c \
UMFPACK/Source/umf_mem_alloc_element.c \
UMFPACK/Source/umf_mem_alloc_head_block.c \
UMFPACK/Source/umf_mem_alloc_tail_block.c \
UMFPACK/Source/umf_mem_free_tail_block.c \
UMFPACK/Source/umf_mem_init_memoryspace.c \
UMFPACK/Source/umf_row_search.c \
UMFPACK/Source/umf_scale_column.c \
UMFPACK/Source/umf_set_stats.c \
UMFPACK/Source/umf_symbolic_usage.c \
UMFPACK/Source/umf_transpose.c \
UMFPACK/Source/umf_tuple_lengths.c \
UMFPACK/Source/umf_valid_symbolic.c \
UMFPACK/Source/umf_grow_front.c \
UMFPACK/Source/umf_start_front.c \
UMFPACK/Source/umf_store_lu.c \
UMFPACK/Source/umf_scale.c \
UMFPACK/Source/umfpack_free_numeric.c \
UMFPACK/Source/umfpack_free_symbolic.c \
UMFPACK/Source/umfpack_numeric.c \
UMFPACK/Source/umfpack_qsymbolic.c \
UMFPACK/Source/umfpack_symbolic.c \
-o ../mwe ../mwe.c \
/usr/lib/libblas.so.3 -lm
