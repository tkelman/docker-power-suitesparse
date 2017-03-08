#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_aat.c -o amd_l_aat.o
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_2.c -o amd_l_2.o
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_postorder.c -o amd_l_postorder.o
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_post_tree.c -o amd_l_post_tree.o
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_defaults.c -o amd_l_defaults.o
gcc -O3 -fexceptions -fPIC -IAMD/Include -ISuiteSparse_config -DDLONG -c AMD/Source/amd_valid.c -o amd_l_valid.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_aat.c -o cholmod_l_aat.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_band.c -o cholmod_l_band.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_change_factor.c -o cholmod_l_change_factor.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_common.c -o cholmod_l_common.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_copy.c -o cholmod_l_copy.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_error.c -o cholmod_l_error.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_factor.c -o cholmod_l_factor.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_memory.c -o cholmod_l_memory.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_sparse.c -o cholmod_l_sparse.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Core/cholmod_transpose.c -o cholmod_l_transpose.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Check/cholmod_check.c -o cholmod_l_check.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_amd.c -o cholmod_l_amd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_analyze.c -o cholmod_l_analyze.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_colamd.c -o cholmod_l_colamd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_etree.c -o cholmod_l_etree.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_postorder.c -o cholmod_l_postorder.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Cholesky/cholmod_rowcolcounts.c -o cholmod_l_rowcolcounts.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -IAMD/Include -IAMD/Source -ICOLAMD/Include -ICCOLAMD/Include -ICAMD/Include -ICHOLMOD/Include -ISuiteSparse_config CHOLMOD/Supernodal/cholmod_super_symbolic.c -o cholmod_l_super_symbolic.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_analyze.c -o umf_l_analyze.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_apply_order.c -o umf_l_apply_order.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_colamd.c -o umf_l_colamd.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_free.c -o umf_l_free.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_fsize.c -o umf_l_fsize.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_is_permutation.c -o umf_l_is_permutation.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_malloc.c -o umf_l_malloc.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_realloc.c -o umf_l_realloc.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_singletons.c -o umf_l_singletons.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -DDLONG -c UMFPACK/Source/umf_cholmod.c -o umf_l_cholmod.o
gcc -O3 -fexceptions -fPIC  -IUMFPACK/Include -IUMFPACK/Source -IAMD/Include -ISuiteSparse_config -ICHOLMOD/Include -c UMFPACK/Source/umfpack_tictoc.c -o umfpack_gn_tictoc.o
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
amd_l_aat.o amd_l_2.o amd_l_postorder.o amd_l_post_tree.o amd_l_defaults.o amd_l_valid.o \
cholmod_l_aat.o cholmod_l_band.o cholmod_l_change_factor.o cholmod_l_common.o cholmod_l_copy.o \
cholmod_l_error.o cholmod_l_factor.o cholmod_l_memory.o cholmod_l_sparse.o cholmod_l_transpose.o \
cholmod_l_check.o cholmod_l_amd.o cholmod_l_analyze.o cholmod_l_colamd.o cholmod_l_etree.o \
cholmod_l_postorder.o cholmod_l_rowcolcounts.o cholmod_l_super_symbolic.o \
umf_l_analyze.o umf_l_apply_order.o umf_l_colamd.o umf_l_free.o umf_l_fsize.o umf_l_is_permutation.o umf_l_malloc.o umf_l_realloc.o \
umf_l_singletons.o umf_l_cholmod.o umfpack_gn_tictoc.o \
umf_zl_assemble_fixq.o umf_zl_store_lu_drop.o umf_zl_assemble.o umf_zl_blas3_update.o umf_zl_build_tuples.o umf_zl_create_element.o \
umf_zl_extend_front.o umf_zl_garbage_collection.o umf_zl_get_memory.o umf_zl_init_front.o umf_zl_kernel.o umf_zl_kernel_init.o umf_zl_kernel_wrapup.o umf_zl_local_search.o umf_zl_mem_alloc_element.o umf_zl_mem_alloc_head_block.o umf_zl_mem_alloc_tail_block.o umf_zl_mem_free_tail_block.o umf_zl_mem_init_memoryspace.o \
umf_zl_row_search.o umf_zl_scale_column.o umf_zl_set_stats.o umf_zl_symbolic_usage.o umf_zl_transpose.o umf_zl_tuple_lengths.o \
umf_zl_valid_symbolic.o umf_zl_grow_front.o umf_zl_start_front.o umf_zl_store_lu.o umf_zl_scale.o \
umfpack_zl_free_numeric.o umfpack_zl_free_symbolic.o umfpack_zl_numeric.o umfpack_zl_qsymbolic.o umfpack_zl_symbolic.o \
-lm /usr/lib/libblas.so.3
