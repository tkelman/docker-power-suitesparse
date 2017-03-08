#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse/SuiteSparse_config
gcc -O3 -fexceptions -fPIC -c SuiteSparse_config.c
ar rs libsuitesparseconfig.a SuiteSparse_config.o
cd ../AMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_aat.c -o amd_l_aat.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_1.c -o amd_l_1.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_2.c -o amd_l_2.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_dump.c -o amd_l_dump.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_postorder.c -o amd_l_postorder.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_post_tree.c -o amd_l_post_tree.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_defaults.c -o amd_l_defaults.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_order.c -o amd_l_order.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_control.c -o amd_l_control.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_info.c -o amd_l_info.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_valid.c -o amd_l_valid.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/amd_preprocess.c -o amd_l_preprocess.o
ar rs libamd.a amd_l_aat.o amd_l_1.o amd_l_2.o amd_l_dump.o amd_l_postorder.o amd_l_post_tree.o amd_l_defaults.o amd_l_order.o amd_l_control.o amd_l_info.o amd_l_valid.o amd_l_preprocess.o
cd ../../COLAMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -c ../Source/colamd.c -DDLONG -o colamd_l.o
ar rs  libcolamd.a colamd_l.o
cd ../../CHOLMOD/Lib
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_aat.c -o cholmod_l_aat.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_add.c -o cholmod_l_add.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_band.c -o cholmod_l_band.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_change_factor.c -o cholmod_l_change_factor.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_common.c -o cholmod_l_common.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_complex.c -o cholmod_l_complex.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_copy.c -o cholmod_l_copy.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_dense.c -o cholmod_l_dense.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_error.c -o cholmod_l_error.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_factor.c -o cholmod_l_factor.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_memory.c -o cholmod_l_memory.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_sparse.c -o cholmod_l_sparse.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_transpose.c -o cholmod_l_transpose.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_triplet.c -o cholmod_l_triplet.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_version.c -o cholmod_l_version.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_check.c -o cholmod_l_check.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_read.c -o cholmod_l_read.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_write.c -o cholmod_l_write.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_amd.c -o cholmod_l_amd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_analyze.c -o cholmod_l_analyze.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_colamd.c -o cholmod_l_colamd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_etree.c -o cholmod_l_etree.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_factorize.c -o cholmod_l_factorize.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_postorder.c -o cholmod_l_postorder.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rcond.c -o cholmod_l_rcond.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_resymbol.c -o cholmod_l_resymbol.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rowcolcounts.c -o cholmod_l_rowcolcounts.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rowfac.c -o cholmod_l_rowfac.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_solve.c -o cholmod_l_solve.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_spsolve.c -o cholmod_l_spsolve.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_drop.c -o cholmod_l_drop.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_horzcat.c -o cholmod_l_horzcat.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_norm.c -o cholmod_l_norm.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_scale.c -o cholmod_l_scale.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_sdmult.c -o cholmod_l_sdmult.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_ssmult.c -o cholmod_l_ssmult.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_submatrix.c -o cholmod_l_submatrix.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_vertcat.c -o cholmod_l_vertcat.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_symmetry.c -o cholmod_l_symmetry.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_rowadd.c -o cholmod_l_rowadd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_rowdel.c -o cholmod_l_rowdel.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_updown.c -o cholmod_l_updown.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_numeric.c -o cholmod_l_super_numeric.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_solve.c -o cholmod_l_super_solve.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_symbolic.c -o cholmod_l_super_symbolic.o
ar rs  libcholmod.a cholmod_l_aat.o cholmod_l_add.o cholmod_l_band.o cholmod_l_change_factor.o cholmod_l_common.o cholmod_l_complex.o cholmod_l_copy.o cholmod_l_dense.o cholmod_l_error.o cholmod_l_factor.o cholmod_l_memory.o cholmod_l_sparse.o cholmod_l_transpose.o cholmod_l_triplet.o cholmod_l_version.o cholmod_l_check.o cholmod_l_read.o cholmod_l_write.o cholmod_l_amd.o cholmod_l_analyze.o cholmod_l_colamd.o cholmod_l_etree.o cholmod_l_factorize.o cholmod_l_postorder.o cholmod_l_rcond.o cholmod_l_resymbol.o cholmod_l_rowcolcounts.o cholmod_l_rowfac.o cholmod_l_solve.o cholmod_l_spsolve.o cholmod_l_drop.o cholmod_l_horzcat.o cholmod_l_norm.o cholmod_l_scale.o cholmod_l_sdmult.o cholmod_l_ssmult.o cholmod_l_submatrix.o cholmod_l_vertcat.o cholmod_l_symmetry.o cholmod_l_rowadd.o cholmod_l_rowdel.o cholmod_l_updown.o cholmod_l_super_numeric.o cholmod_l_super_solve.o cholmod_l_super_symbolic.o
cd ../../UMFPACK/Lib
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_analyze.c -o umf_l_analyze.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_apply_order.c -o umf_l_apply_order.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_colamd.c -o umf_l_colamd.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_free.c -o umf_l_free.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_fsize.c -o umf_l_fsize.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_is_permutation.c -o umf_l_is_permutation.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_malloc.c -o umf_l_malloc.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_realloc.c -o umf_l_realloc.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_report_perm.c -o umf_l_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_singletons.c -o umf_l_singletons.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_cholmod.c -o umf_l_cholmod.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -c ../Source/umfpack_timer.c -o umfpack_gn_timer.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -c ../Source/umfpack_tictoc.c -o umfpack_gn_tictoc.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DCONJUGATE_SOLVE -c ../Source/umf_ltsolve.c -o umf_zl_lhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DCONJUGATE_SOLVE -c ../Source/umf_utsolve.c -o umf_zl_uhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DDO_MAP -c ../Source/umf_triplet.c -o umf_zl_triplet_map_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DDO_VALUES -c ../Source/umf_triplet.c -o umf_zl_triplet_nomap_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_triplet.c -o umf_zl_triplet_nomap_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DDO_MAP -DDO_VALUES -c ../Source/umf_triplet.c -o umf_zl_triplet_map_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DFIXQ -c ../Source/umf_assemble.c -o umf_zl_assemble_fixq.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DDROP -c ../Source/umf_store_lu.c -o umf_zl_store_lu_drop.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_assemble.c -o umf_zl_assemble.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_blas3_update.c -o umf_zl_blas3_update.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_build_tuples.c -o umf_zl_build_tuples.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_create_element.c -o umf_zl_create_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_dump.c -o umf_zl_dump.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_extend_front.c -o umf_zl_extend_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_garbage_collection.c -o umf_zl_garbage_collection.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_get_memory.c -o umf_zl_get_memory.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_init_front.c -o umf_zl_init_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_kernel.c -o umf_zl_kernel.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_kernel_init.c -o umf_zl_kernel_init.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_kernel_wrapup.c -o umf_zl_kernel_wrapup.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_local_search.c -o umf_zl_local_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_lsolve.c -o umf_zl_lsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_ltsolve.c -o umf_zl_ltsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_mem_alloc_element.c -o umf_zl_mem_alloc_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_mem_alloc_head_block.c -o umf_zl_mem_alloc_head_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_mem_alloc_tail_block.c -o umf_zl_mem_alloc_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_mem_free_tail_block.c -o umf_zl_mem_free_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_mem_init_memoryspace.c -o umf_zl_mem_init_memoryspace.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_report_vector.c -o umf_zl_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_row_search.c -o umf_zl_row_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_scale_column.c -o umf_zl_scale_column.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_set_stats.c -o umf_zl_set_stats.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_solve.c -o umf_zl_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_symbolic_usage.c -o umf_zl_symbolic_usage.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_transpose.c -o umf_zl_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_tuple_lengths.c -o umf_zl_tuple_lengths.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_usolve.c -o umf_zl_usolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_utsolve.c -o umf_zl_utsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_valid_numeric.c -o umf_zl_valid_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_valid_symbolic.c -o umf_zl_valid_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_grow_front.c -o umf_zl_grow_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_start_front.c -o umf_zl_start_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_store_lu.c -o umf_zl_store_lu.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umf_scale.c -o umf_zl_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_free_numeric.c -o umfpack_zl_free_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_free_symbolic.c -o umfpack_zl_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_numeric.c -o umfpack_zl_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_qsymbolic.c -o umfpack_zl_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_symbolic.c -o umfpack_zl_symbolic.o
ar rs  libumfpack.a umf_l_analyze.o umf_l_apply_order.o umf_l_colamd.o umf_l_free.o umf_l_fsize.o umf_l_is_permutation.o umf_l_malloc.o umf_l_realloc.o umf_l_report_perm.o umf_l_singletons.o umf_l_cholmod.o umfpack_gn_timer.o umfpack_gn_tictoc.o umf_zl_lhsolve.o umf_zl_uhsolve.o umf_zl_triplet_map_nox.o umf_zl_triplet_nomap_x.o umf_zl_triplet_nomap_nox.o umf_zl_triplet_map_x.o umf_zl_assemble_fixq.o umf_zl_store_lu_drop.o umf_zl_assemble.o umf_zl_blas3_update.o umf_zl_build_tuples.o umf_zl_create_element.o umf_zl_dump.o umf_zl_extend_front.o umf_zl_garbage_collection.o umf_zl_get_memory.o umf_zl_init_front.o umf_zl_kernel.o umf_zl_kernel_init.o umf_zl_kernel_wrapup.o umf_zl_local_search.o umf_zl_lsolve.o umf_zl_ltsolve.o umf_zl_mem_alloc_element.o umf_zl_mem_alloc_head_block.o umf_zl_mem_alloc_tail_block.o umf_zl_mem_free_tail_block.o umf_zl_mem_init_memoryspace.o umf_zl_report_vector.o umf_zl_row_search.o umf_zl_scale_column.o umf_zl_set_stats.o umf_zl_solve.o umf_zl_symbolic_usage.o umf_zl_transpose.o umf_zl_tuple_lengths.o umf_zl_usolve.o umf_zl_utsolve.o umf_zl_valid_numeric.o umf_zl_valid_symbolic.o umf_zl_grow_front.o umf_zl_start_front.o umf_zl_store_lu.o umf_zl_scale.o \
  umfpack_zl_free_numeric.o umfpack_zl_free_symbolic.o umfpack_zl_numeric.o umfpack_zl_qsymbolic.o umfpack_zl_symbolic.o
cd ../../..
gcc -O3 -o mwe mwe.c \
  SuiteSparse/UMFPACK/Lib/libumfpack.a \
  SuiteSparse/CHOLMOD/Lib/libcholmod.a \
  SuiteSparse/AMD/Lib/libamd.a \
  SuiteSparse/COLAMD/Lib/libcolamd.a \
  SuiteSparse/SuiteSparse_config/libsuitesparseconfig.a \
  /usr/lib/libblas.so.3 -lm
