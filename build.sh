#!/bin/bash -ex
if ! [ -e SuiteSparse-4.4.5.tar.gz ]; then
  curl -LO http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz
fi
rm -rf SuiteSparse mwe
tar -xzf SuiteSparse-4.4.5.tar.gz
#make -C SuiteSparse library
cd SuiteSparse/SuiteSparse_config/xerbla
gcc -O3 -fexceptions -fPIC -c xerbla.c
ar rs  libcerbla.a xerbla.o
cd ..
gcc -O3 -fexceptions -fPIC -c SuiteSparse_config.c
ar rs libsuitesparseconfig.a SuiteSparse_config.o
cd ../AMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_aat.c -o amd_i_aat.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_1.c -o amd_i_1.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_2.c -o amd_i_2.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_dump.c -o amd_i_dump.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_postorder.c -o amd_i_postorder.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_post_tree.c -o amd_i_post_tree.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_defaults.c -o amd_i_defaults.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_order.c -o amd_i_order.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_control.c -o amd_i_control.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_info.c -o amd_i_info.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_valid.c -o amd_i_valid.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/amd_preprocess.c -o amd_i_preprocess.o
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
ar rs libamd.a amd_i_aat.o amd_i_1.o amd_i_2.o amd_i_dump.o amd_i_postorder.o amd_i_post_tree.o amd_i_defaults.o amd_i_order.o amd_i_control.o amd_i_info.o amd_i_valid.o amd_i_preprocess.o amd_l_aat.o amd_l_1.o amd_l_2.o amd_l_dump.o amd_l_postorder.o amd_l_post_tree.o amd_l_defaults.o amd_l_order.o amd_l_control.o amd_l_info.o amd_l_valid.o amd_l_preprocess.o
cd ../../BTF/Lib
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config ../Source/btf_order.c -o btf_order.o
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config ../Source/btf_maxtrans.c -o btf_maxtrans.o
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config ../Source/btf_strongcomp.c -o btf_strongcomp.o
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config -DDLONG ../Source/btf_order.c -o btf_l_order.o
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config -DDLONG ../Source/btf_maxtrans.c -o btf_l_maxtrans.o
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config -DDLONG ../Source/btf_strongcomp.c -o btf_l_strongcomp.o
ar rs  libbtf.a btf_order.o btf_maxtrans.o btf_strongcomp.o btf_l_order.o btf_l_maxtrans.o btf_l_strongcomp.o
cd ../../CAMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_aat.c -o camd_i_aat.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_1.c -o camd_i_1.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_2.c -o camd_i_2.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_dump.c -o camd_i_dump.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_postorder.c -o camd_i_postorder.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_defaults.c -o camd_i_defaults.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_order.c -o camd_i_order.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_control.c -o camd_i_control.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_info.c -o camd_i_info.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_valid.c -o camd_i_valid.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDINT -c ../Source/camd_preprocess.c -o camd_i_preprocess.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_aat.c -o camd_l_aat.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_1.c -o camd_l_1.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_2.c -o camd_l_2.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_dump.c -o camd_l_dump.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_postorder.c -o camd_l_postorder.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_defaults.c -o camd_l_defaults.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_order.c -o camd_l_order.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_control.c -o camd_l_control.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_info.c -o camd_l_info.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_valid.c -o camd_l_valid.o
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -DDLONG -c ../Source/camd_preprocess.c -o camd_l_preprocess.o
ar rs  libcamd.a camd_i_aat.o camd_i_1.o camd_i_2.o camd_i_dump.o camd_i_postorder.o camd_i_defaults.o camd_i_order.o camd_i_control.o camd_i_info.o camd_i_valid.o camd_i_preprocess.o camd_l_aat.o camd_l_1.o camd_l_2.o camd_l_dump.o camd_l_postorder.o camd_l_defaults.o camd_l_order.o camd_l_control.o camd_l_info.o camd_l_valid.o camd_l_preprocess.o
cd ../../CCOLAMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -c ../Source/ccolamd.c
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -c ../Source/ccolamd.c -DDLONG -o ccolamd_l.o
ar rs  libccolamd.a ccolamd.o ccolamd_l.o
cd ../../COLAMD/Lib
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -c ../Source/colamd.c
gcc -O3 -fexceptions -fPIC -I../Include -I../../SuiteSparse_config -c ../Source/colamd.c -DDLONG -o colamd_l.o
ar rs  libcolamd.a colamd.o colamd_l.o
cd ../../CHOLMOD/Lib
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_aat.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_add.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_band.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_change_factor.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_common.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_complex.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_copy.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_dense.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_error.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_factor.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_memory.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_sparse.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_transpose.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_triplet.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Core/cholmod_version.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_check.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_read.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Check/cholmod_write.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_amd.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_analyze.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_colamd.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_etree.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_factorize.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_postorder.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rcond.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_resymbol.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rowcolcounts.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_rowfac.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_solve.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Cholesky/cholmod_spsolve.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_drop.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_horzcat.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_norm.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_scale.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_sdmult.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_ssmult.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_submatrix.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_vertcat.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../MatrixOps/cholmod_symmetry.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_rowadd.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_rowdel.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Modify/cholmod_updown.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_numeric.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_solve.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Supernodal/cholmod_super_symbolic.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_ccolamd.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_csymamd.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_metis.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_nesdis.c
gcc -O3 -fexceptions -fPIC  -DNPARTITION -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_camd.c
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
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_ccolamd.c -o cholmod_l_ccolamd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_csymamd.c -o cholmod_l_csymamd.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_metis.c -o cholmod_l_metis.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_nesdis.c -o cholmod_l_nesdis.o
gcc -O3 -fexceptions -fPIC  -DNPARTITION -DDLONG -c -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include -I../../CCOLAMD/Include -I../../CAMD/Include -I../Include -I../../SuiteSparse_config ../Partition/cholmod_camd.c -o cholmod_l_camd.o
ar rs  libcholmod.a cholmod_aat.o cholmod_add.o cholmod_band.o cholmod_change_factor.o cholmod_common.o cholmod_complex.o cholmod_copy.o cholmod_dense.o cholmod_error.o cholmod_factor.o cholmod_memory.o cholmod_sparse.o cholmod_transpose.o cholmod_triplet.o cholmod_version.o cholmod_check.o cholmod_read.o cholmod_write.o cholmod_amd.o cholmod_analyze.o cholmod_colamd.o cholmod_etree.o cholmod_factorize.o cholmod_postorder.o cholmod_rcond.o cholmod_resymbol.o cholmod_rowcolcounts.o cholmod_rowfac.o cholmod_solve.o cholmod_spsolve.o cholmod_drop.o cholmod_horzcat.o cholmod_norm.o cholmod_scale.o cholmod_sdmult.o cholmod_ssmult.o cholmod_submatrix.o cholmod_vertcat.o cholmod_symmetry.o cholmod_rowadd.o cholmod_rowdel.o cholmod_updown.o cholmod_super_numeric.o cholmod_super_solve.o cholmod_super_symbolic.o  cholmod_ccolamd.o cholmod_csymamd.o cholmod_metis.o cholmod_nesdis.o cholmod_camd.o  cholmod_l_aat.o cholmod_l_add.o cholmod_l_band.o cholmod_l_change_factor.o cholmod_l_common.o cholmod_l_complex.o cholmod_l_copy.o cholmod_l_dense.o cholmod_l_error.o cholmod_l_factor.o cholmod_l_memory.o cholmod_l_sparse.o cholmod_l_transpose.o cholmod_l_triplet.o cholmod_l_version.o cholmod_l_check.o cholmod_l_read.o cholmod_l_write.o cholmod_l_amd.o cholmod_l_analyze.o cholmod_l_colamd.o cholmod_l_etree.o cholmod_l_factorize.o cholmod_l_postorder.o cholmod_l_rcond.o cholmod_l_resymbol.o cholmod_l_rowcolcounts.o cholmod_l_rowfac.o cholmod_l_solve.o cholmod_l_spsolve.o cholmod_l_drop.o cholmod_l_horzcat.o cholmod_l_norm.o cholmod_l_scale.o cholmod_l_sdmult.o cholmod_l_ssmult.o cholmod_l_submatrix.o cholmod_l_vertcat.o cholmod_l_symmetry.o cholmod_l_rowadd.o cholmod_l_rowdel.o cholmod_l_updown.o cholmod_l_super_numeric.o cholmod_l_super_solve.o cholmod_l_super_symbolic.o cholmod_l_ccolamd.o cholmod_l_csymamd.o cholmod_l_metis.o cholmod_l_nesdis.o cholmod_l_camd.o 
cd ../../KLU/Lib
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_symbolic.c -o klu_free_symbolic.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_defaults.c -o klu_defaults.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_analyze_given.c -o klu_analyze_given.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_analyze.c -o klu_analyze.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_memory.c -o klu_memory.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_symbolic.c -o klu_l_free_symbolic.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_defaults.c -o klu_l_defaults.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_analyze_given.c -o klu_l_analyze_given.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_analyze.c -o klu_l_analyze.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_memory.c -o klu_l_memory.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu.c -o klu_d.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_kernel.c -o klu_d_kernel.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_dump.c -o klu_d_dump.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_factor.c -o klu_d_factor.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_numeric.c -o klu_d_free_numeric.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_solve.c -o klu_d_solve.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_scale.c -o klu_d_scale.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_refactor.c -o klu_d_refactor.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_tsolve.c -o klu_d_tsolve.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_diagnostics.c -o klu_d_diagnostics.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_sort.c -o klu_d_sort.o
gcc -O3 -fexceptions -fPIC -c -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_extract.c -o klu_d_extract.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu.c -o klu_z.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_kernel.c -o klu_z_kernel.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_dump.c -o klu_z_dump.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_factor.c -o klu_z_factor.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_numeric.c -o klu_z_free_numeric.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_solve.c -o klu_z_solve.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_scale.c -o klu_z_scale.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_refactor.c -o klu_z_refactor.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_tsolve.c -o klu_z_tsolve.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_diagnostics.c -o klu_z_diagnostics.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_sort.c -o klu_z_sort.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_extract.c -o klu_z_extract.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu.c -o klu_l.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_kernel.c -o klu_l_kernel.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_dump.c -o klu_l_dump.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_factor.c -o klu_l_factor.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_numeric.c -o klu_l_free_numeric.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_solve.c -o klu_l_solve.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_scale.c -o klu_l_scale.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_refactor.c -o klu_l_refactor.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_tsolve.c -o klu_l_tsolve.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_diagnostics.c -o klu_l_diagnostics.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_sort.c -o klu_l_sort.o
gcc -O3 -fexceptions -fPIC -c -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_extract.c -o klu_l_extract.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu.c -o klu_zl.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_kernel.c -o klu_zl_kernel.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_dump.c -o klu_zl_dump.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_factor.c -o klu_zl_factor.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_free_numeric.c -o klu_zl_free_numeric.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_solve.c -o klu_zl_solve.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_scale.c -o klu_zl_scale.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_refactor.c -o klu_zl_refactor.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_tsolve.c -o klu_zl_tsolve.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_diagnostics.c -o klu_zl_diagnostics.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_sort.c -o klu_zl_sort.o
gcc -O3 -fexceptions -fPIC -c -DCOMPLEX -DDLONG -I../../AMD/Include -I../../COLAMD/Include -I../../BTF/Include -I../Include -I../../SuiteSparse_config ../Source/klu_extract.c -o klu_zl_extract.o
ar rs  libklu.a klu_free_symbolic.o klu_defaults.o klu_analyze_given.o klu_analyze.o klu_memory.o klu_l_free_symbolic.o klu_l_defaults.o klu_l_analyze_given.o klu_l_analyze.o klu_l_memory.o klu_d.o klu_d_kernel.o klu_d_dump.o klu_d_factor.o klu_d_free_numeric.o klu_d_solve.o klu_d_scale.o klu_d_refactor.o klu_d_tsolve.o klu_d_diagnostics.o klu_d_sort.o klu_d_extract.o klu_z.o klu_z_kernel.o klu_z_dump.o klu_z_factor.o klu_z_free_numeric.o klu_z_solve.o klu_z_scale.o klu_z_refactor.o klu_z_tsolve.o klu_z_diagnostics.o klu_z_sort.o klu_z_extract.o klu_l.o klu_l_kernel.o klu_l_dump.o klu_l_factor.o klu_l_free_numeric.o klu_l_solve.o klu_l_scale.o klu_l_refactor.o klu_l_tsolve.o klu_l_diagnostics.o klu_l_sort.o klu_l_extract.o klu_zl.o klu_zl_kernel.o klu_zl_dump.o klu_zl_factor.o klu_zl_free_numeric.o klu_zl_solve.o klu_zl_scale.o klu_zl_refactor.o klu_zl_tsolve.o klu_zl_diagnostics.o klu_zl_sort.o klu_zl_extract.o
cd ../../LDL/Lib
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/ldl.c -o ldl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DLDL_LONG -c ../Source/ldl.c -o ldll.o
ar rs  libldl.a ldl.o ldll.o
cd ../../UMFPACK/Lib
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_analyze.c -o umf_i_analyze.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_apply_order.c -o umf_i_apply_order.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_colamd.c -o umf_i_colamd.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_free.c -o umf_i_free.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_fsize.c -o umf_i_fsize.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_is_permutation.c -o umf_i_is_permutation.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_malloc.c -o umf_i_malloc.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_realloc.c -o umf_i_realloc.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_report_perm.c -o umf_i_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_singletons.c -o umf_i_singletons.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_cholmod.c -o umf_i_cholmod.o
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
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DCONJUGATE_SOLVE -c ../Source/umf_ltsolve.c -o umf_di_lhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DCONJUGATE_SOLVE -c ../Source/umf_utsolve.c -o umf_di_uhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DDO_MAP -c ../Source/umf_triplet.c -o umf_di_triplet_map_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DDO_VALUES -c ../Source/umf_triplet.c -o umf_di_triplet_nomap_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_triplet.c -o umf_di_triplet_nomap_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DDO_MAP -DDO_VALUES -c ../Source/umf_triplet.c -o umf_di_triplet_map_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DFIXQ -c ../Source/umf_assemble.c -o umf_di_assemble_fixq.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DDROP -c ../Source/umf_store_lu.c -o umf_di_store_lu_drop.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_assemble.c -o umf_di_assemble.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_blas3_update.c -o umf_di_blas3_update.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_build_tuples.c -o umf_di_build_tuples.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_create_element.c -o umf_di_create_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_dump.c -o umf_di_dump.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_extend_front.c -o umf_di_extend_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_garbage_collection.c -o umf_di_garbage_collection.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_get_memory.c -o umf_di_get_memory.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_init_front.c -o umf_di_init_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_kernel.c -o umf_di_kernel.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_kernel_init.c -o umf_di_kernel_init.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_kernel_wrapup.c -o umf_di_kernel_wrapup.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_local_search.c -o umf_di_local_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_lsolve.c -o umf_di_lsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_ltsolve.c -o umf_di_ltsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_mem_alloc_element.c -o umf_di_mem_alloc_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_mem_alloc_head_block.c -o umf_di_mem_alloc_head_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_mem_alloc_tail_block.c -o umf_di_mem_alloc_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_mem_free_tail_block.c -o umf_di_mem_free_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_mem_init_memoryspace.c -o umf_di_mem_init_memoryspace.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_report_vector.c -o umf_di_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_row_search.c -o umf_di_row_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_scale_column.c -o umf_di_scale_column.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_set_stats.c -o umf_di_set_stats.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_solve.c -o umf_di_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_symbolic_usage.c -o umf_di_symbolic_usage.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_transpose.c -o umf_di_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_tuple_lengths.c -o umf_di_tuple_lengths.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_usolve.c -o umf_di_usolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_utsolve.c -o umf_di_utsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_valid_numeric.c -o umf_di_valid_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_valid_symbolic.c -o umf_di_valid_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_grow_front.c -o umf_di_grow_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_start_front.c -o umf_di_start_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_store_lu.c -o umf_di_store_lu.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umf_scale.c -o umf_di_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -DWSOLVE -c ../Source/umfpack_solve.c -o umfpack_di_wsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_col_to_triplet.c -o umfpack_di_col_to_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_defaults.c -o umfpack_di_defaults.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_free_numeric.c -o umfpack_di_free_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_free_symbolic.c -o umfpack_di_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_get_numeric.c -o umfpack_di_get_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_get_lunz.c -o umfpack_di_get_lunz.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_get_symbolic.c -o umfpack_di_get_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_get_determinant.c -o umfpack_di_get_determinant.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_numeric.c -o umfpack_di_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_qsymbolic.c -o umfpack_di_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_control.c -o umfpack_di_report_control.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_info.c -o umfpack_di_report_info.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_matrix.c -o umfpack_di_report_matrix.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_numeric.c -o umfpack_di_report_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_perm.c -o umfpack_di_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_status.c -o umfpack_di_report_status.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_symbolic.c -o umfpack_di_report_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_triplet.c -o umfpack_di_report_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_report_vector.c -o umfpack_di_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_solve.c -o umfpack_di_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_symbolic.c -o umfpack_di_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_transpose.c -o umfpack_di_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_triplet_to_col.c -o umfpack_di_triplet_to_col.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_scale.c -o umfpack_di_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_load_numeric.c -o umfpack_di_load_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_save_numeric.c -o umfpack_di_save_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_load_symbolic.c -o umfpack_di_load_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDINT -c ../Source/umfpack_save_symbolic.c -o umfpack_di_save_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DCONJUGATE_SOLVE -c ../Source/umf_ltsolve.c -o umf_dl_lhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DCONJUGATE_SOLVE -c ../Source/umf_utsolve.c -o umf_dl_uhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DDO_MAP -c ../Source/umf_triplet.c -o umf_dl_triplet_map_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DDO_VALUES -c ../Source/umf_triplet.c -o umf_dl_triplet_nomap_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_triplet.c -o umf_dl_triplet_nomap_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DDO_MAP -DDO_VALUES -c ../Source/umf_triplet.c -o umf_dl_triplet_map_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DFIXQ -c ../Source/umf_assemble.c -o umf_dl_assemble_fixq.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DDROP -c ../Source/umf_store_lu.c -o umf_dl_store_lu_drop.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_assemble.c -o umf_dl_assemble.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_blas3_update.c -o umf_dl_blas3_update.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_build_tuples.c -o umf_dl_build_tuples.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_create_element.c -o umf_dl_create_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_dump.c -o umf_dl_dump.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_extend_front.c -o umf_dl_extend_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_garbage_collection.c -o umf_dl_garbage_collection.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_get_memory.c -o umf_dl_get_memory.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_init_front.c -o umf_dl_init_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_kernel.c -o umf_dl_kernel.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_kernel_init.c -o umf_dl_kernel_init.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_kernel_wrapup.c -o umf_dl_kernel_wrapup.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_local_search.c -o umf_dl_local_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_lsolve.c -o umf_dl_lsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_ltsolve.c -o umf_dl_ltsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_mem_alloc_element.c -o umf_dl_mem_alloc_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_mem_alloc_head_block.c -o umf_dl_mem_alloc_head_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_mem_alloc_tail_block.c -o umf_dl_mem_alloc_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_mem_free_tail_block.c -o umf_dl_mem_free_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_mem_init_memoryspace.c -o umf_dl_mem_init_memoryspace.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_report_vector.c -o umf_dl_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_row_search.c -o umf_dl_row_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_scale_column.c -o umf_dl_scale_column.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_set_stats.c -o umf_dl_set_stats.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_solve.c -o umf_dl_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_symbolic_usage.c -o umf_dl_symbolic_usage.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_transpose.c -o umf_dl_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_tuple_lengths.c -o umf_dl_tuple_lengths.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_usolve.c -o umf_dl_usolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_utsolve.c -o umf_dl_utsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_valid_numeric.c -o umf_dl_valid_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_valid_symbolic.c -o umf_dl_valid_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_grow_front.c -o umf_dl_grow_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_start_front.c -o umf_dl_start_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_store_lu.c -o umf_dl_store_lu.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umf_scale.c -o umf_dl_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -DWSOLVE -c ../Source/umfpack_solve.c -o umfpack_dl_wsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_col_to_triplet.c -o umfpack_dl_col_to_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_defaults.c -o umfpack_dl_defaults.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_free_numeric.c -o umfpack_dl_free_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_free_symbolic.c -o umfpack_dl_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_get_numeric.c -o umfpack_dl_get_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_get_lunz.c -o umfpack_dl_get_lunz.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_get_symbolic.c -o umfpack_dl_get_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_get_determinant.c -o umfpack_dl_get_determinant.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_numeric.c -o umfpack_dl_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_qsymbolic.c -o umfpack_dl_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_control.c -o umfpack_dl_report_control.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_info.c -o umfpack_dl_report_info.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_matrix.c -o umfpack_dl_report_matrix.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_numeric.c -o umfpack_dl_report_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_perm.c -o umfpack_dl_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_status.c -o umfpack_dl_report_status.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_symbolic.c -o umfpack_dl_report_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_triplet.c -o umfpack_dl_report_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_report_vector.c -o umfpack_dl_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_solve.c -o umfpack_dl_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_symbolic.c -o umfpack_dl_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_transpose.c -o umfpack_dl_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_triplet_to_col.c -o umfpack_dl_triplet_to_col.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_scale.c -o umfpack_dl_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_load_numeric.c -o umfpack_dl_load_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_save_numeric.c -o umfpack_dl_save_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_load_symbolic.c -o umfpack_dl_load_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DDLONG -c ../Source/umfpack_save_symbolic.c -o umfpack_dl_save_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DCONJUGATE_SOLVE -c ../Source/umf_ltsolve.c -o umf_zi_lhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DCONJUGATE_SOLVE -c ../Source/umf_utsolve.c -o umf_zi_uhsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DDO_MAP -c ../Source/umf_triplet.c -o umf_zi_triplet_map_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DDO_VALUES -c ../Source/umf_triplet.c -o umf_zi_triplet_nomap_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_triplet.c -o umf_zi_triplet_nomap_nox.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DDO_MAP -DDO_VALUES -c ../Source/umf_triplet.c -o umf_zi_triplet_map_x.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DFIXQ -c ../Source/umf_assemble.c -o umf_zi_assemble_fixq.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DDROP -c ../Source/umf_store_lu.c -o umf_zi_store_lu_drop.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_assemble.c -o umf_zi_assemble.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_blas3_update.c -o umf_zi_blas3_update.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_build_tuples.c -o umf_zi_build_tuples.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_create_element.c -o umf_zi_create_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_dump.c -o umf_zi_dump.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_extend_front.c -o umf_zi_extend_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_garbage_collection.c -o umf_zi_garbage_collection.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_get_memory.c -o umf_zi_get_memory.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_init_front.c -o umf_zi_init_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_kernel.c -o umf_zi_kernel.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_kernel_init.c -o umf_zi_kernel_init.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_kernel_wrapup.c -o umf_zi_kernel_wrapup.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_local_search.c -o umf_zi_local_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_lsolve.c -o umf_zi_lsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_ltsolve.c -o umf_zi_ltsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_mem_alloc_element.c -o umf_zi_mem_alloc_element.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_mem_alloc_head_block.c -o umf_zi_mem_alloc_head_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_mem_alloc_tail_block.c -o umf_zi_mem_alloc_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_mem_free_tail_block.c -o umf_zi_mem_free_tail_block.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_mem_init_memoryspace.c -o umf_zi_mem_init_memoryspace.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_report_vector.c -o umf_zi_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_row_search.c -o umf_zi_row_search.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_scale_column.c -o umf_zi_scale_column.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_set_stats.c -o umf_zi_set_stats.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_solve.c -o umf_zi_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_symbolic_usage.c -o umf_zi_symbolic_usage.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_transpose.c -o umf_zi_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_tuple_lengths.c -o umf_zi_tuple_lengths.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_usolve.c -o umf_zi_usolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_utsolve.c -o umf_zi_utsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_valid_numeric.c -o umf_zi_valid_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_valid_symbolic.c -o umf_zi_valid_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_grow_front.c -o umf_zi_grow_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_start_front.c -o umf_zi_start_front.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_store_lu.c -o umf_zi_store_lu.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umf_scale.c -o umf_zi_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -DWSOLVE -c ../Source/umfpack_solve.c -o umfpack_zi_wsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_col_to_triplet.c -o umfpack_zi_col_to_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_defaults.c -o umfpack_zi_defaults.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_free_numeric.c -o umfpack_zi_free_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_free_symbolic.c -o umfpack_zi_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_get_numeric.c -o umfpack_zi_get_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_get_lunz.c -o umfpack_zi_get_lunz.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_get_symbolic.c -o umfpack_zi_get_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_get_determinant.c -o umfpack_zi_get_determinant.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_numeric.c -o umfpack_zi_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_qsymbolic.c -o umfpack_zi_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_control.c -o umfpack_zi_report_control.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_info.c -o umfpack_zi_report_info.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_matrix.c -o umfpack_zi_report_matrix.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_numeric.c -o umfpack_zi_report_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_perm.c -o umfpack_zi_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_status.c -o umfpack_zi_report_status.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_symbolic.c -o umfpack_zi_report_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_triplet.c -o umfpack_zi_report_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_report_vector.c -o umfpack_zi_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_solve.c -o umfpack_zi_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_symbolic.c -o umfpack_zi_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_transpose.c -o umfpack_zi_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_triplet_to_col.c -o umfpack_zi_triplet_to_col.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_scale.c -o umfpack_zi_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_load_numeric.c -o umfpack_zi_load_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_save_numeric.c -o umfpack_zi_save_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_load_symbolic.c -o umfpack_zi_load_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZINT -c ../Source/umfpack_save_symbolic.c -o umfpack_zi_save_symbolic.o
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
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -DWSOLVE -c ../Source/umfpack_solve.c -o umfpack_zl_wsolve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_col_to_triplet.c -o umfpack_zl_col_to_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_defaults.c -o umfpack_zl_defaults.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_free_numeric.c -o umfpack_zl_free_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_free_symbolic.c -o umfpack_zl_free_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_get_numeric.c -o umfpack_zl_get_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_get_lunz.c -o umfpack_zl_get_lunz.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_get_symbolic.c -o umfpack_zl_get_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_get_determinant.c -o umfpack_zl_get_determinant.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_numeric.c -o umfpack_zl_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_qsymbolic.c -o umfpack_zl_qsymbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_control.c -o umfpack_zl_report_control.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_info.c -o umfpack_zl_report_info.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_matrix.c -o umfpack_zl_report_matrix.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_numeric.c -o umfpack_zl_report_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_perm.c -o umfpack_zl_report_perm.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_status.c -o umfpack_zl_report_status.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_symbolic.c -o umfpack_zl_report_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_triplet.c -o umfpack_zl_report_triplet.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_report_vector.c -o umfpack_zl_report_vector.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_solve.c -o umfpack_zl_solve.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_symbolic.c -o umfpack_zl_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_transpose.c -o umfpack_zl_transpose.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_triplet_to_col.c -o umfpack_zl_triplet_to_col.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_scale.c -o umfpack_zl_scale.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_load_numeric.c -o umfpack_zl_load_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_save_numeric.c -o umfpack_zl_save_numeric.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_load_symbolic.c -o umfpack_zl_load_symbolic.o
gcc -O3 -fexceptions -fPIC  -I../Include -I../Source -I../../AMD/Include -I../../SuiteSparse_config -I../../CHOLMOD/Include -DZLONG -c ../Source/umfpack_save_symbolic.c -o umfpack_zl_save_symbolic.o
ar rs  libumfpack.a umf_i_analyze.o umf_i_apply_order.o umf_i_colamd.o umf_i_free.o umf_i_fsize.o umf_i_is_permutation.o umf_i_malloc.o umf_i_realloc.o umf_i_report_perm.o umf_i_singletons.o umf_i_cholmod.o umf_l_analyze.o umf_l_apply_order.o umf_l_colamd.o umf_l_free.o umf_l_fsize.o umf_l_is_permutation.o umf_l_malloc.o umf_l_realloc.o umf_l_report_perm.o umf_l_singletons.o umf_l_cholmod.o umfpack_gn_timer.o umfpack_gn_tictoc.o umf_di_lhsolve.o umf_di_uhsolve.o umf_di_triplet_map_nox.o umf_di_triplet_nomap_x.o umf_di_triplet_nomap_nox.o umf_di_triplet_map_x.o umf_di_assemble_fixq.o umf_di_store_lu_drop.o umf_di_assemble.o umf_di_blas3_update.o umf_di_build_tuples.o umf_di_create_element.o umf_di_dump.o umf_di_extend_front.o umf_di_garbage_collection.o umf_di_get_memory.o umf_di_init_front.o umf_di_kernel.o umf_di_kernel_init.o umf_di_kernel_wrapup.o umf_di_local_search.o umf_di_lsolve.o umf_di_ltsolve.o umf_di_mem_alloc_element.o umf_di_mem_alloc_head_block.o umf_di_mem_alloc_tail_block.o umf_di_mem_free_tail_block.o umf_di_mem_init_memoryspace.o umf_di_report_vector.o umf_di_row_search.o umf_di_scale_column.o umf_di_set_stats.o umf_di_solve.o umf_di_symbolic_usage.o umf_di_transpose.o umf_di_tuple_lengths.o umf_di_usolve.o umf_di_utsolve.o umf_di_valid_numeric.o umf_di_valid_symbolic.o umf_di_grow_front.o umf_di_start_front.o umf_di_store_lu.o umf_di_scale.o umfpack_di_wsolve.o umfpack_di_col_to_triplet.o umfpack_di_defaults.o umfpack_di_free_numeric.o umfpack_di_free_symbolic.o umfpack_di_get_numeric.o umfpack_di_get_lunz.o umfpack_di_get_symbolic.o umfpack_di_get_determinant.o umfpack_di_numeric.o umfpack_di_qsymbolic.o umfpack_di_report_control.o umfpack_di_report_info.o umfpack_di_report_matrix.o umfpack_di_report_numeric.o umfpack_di_report_perm.o umfpack_di_report_status.o umfpack_di_report_symbolic.o umfpack_di_report_triplet.o umfpack_di_report_vector.o umfpack_di_solve.o umfpack_di_symbolic.o umfpack_di_transpose.o umfpack_di_triplet_to_col.o umfpack_di_scale.o umfpack_di_load_numeric.o umfpack_di_save_numeric.o umfpack_di_load_symbolic.o umfpack_di_save_symbolic.o umf_dl_lhsolve.o umf_dl_uhsolve.o umf_dl_triplet_map_nox.o umf_dl_triplet_nomap_x.o umf_dl_triplet_nomap_nox.o umf_dl_triplet_map_x.o umf_dl_assemble_fixq.o umf_dl_store_lu_drop.o umf_dl_assemble.o umf_dl_blas3_update.o umf_dl_build_tuples.o umf_dl_create_element.o umf_dl_dump.o umf_dl_extend_front.o umf_dl_garbage_collection.o umf_dl_get_memory.o umf_dl_init_front.o umf_dl_kernel.o umf_dl_kernel_init.o umf_dl_kernel_wrapup.o umf_dl_local_search.o umf_dl_lsolve.o umf_dl_ltsolve.o umf_dl_mem_alloc_element.o umf_dl_mem_alloc_head_block.o umf_dl_mem_alloc_tail_block.o umf_dl_mem_free_tail_block.o umf_dl_mem_init_memoryspace.o umf_dl_report_vector.o umf_dl_row_search.o umf_dl_scale_column.o umf_dl_set_stats.o umf_dl_solve.o umf_dl_symbolic_usage.o umf_dl_transpose.o umf_dl_tuple_lengths.o umf_dl_usolve.o umf_dl_utsolve.o umf_dl_valid_numeric.o umf_dl_valid_symbolic.o umf_dl_grow_front.o umf_dl_start_front.o umf_dl_store_lu.o umf_dl_scale.o umfpack_dl_wsolve.o umfpack_dl_col_to_triplet.o umfpack_dl_defaults.o umfpack_dl_free_numeric.o umfpack_dl_free_symbolic.o umfpack_dl_get_numeric.o umfpack_dl_get_lunz.o umfpack_dl_get_symbolic.o umfpack_dl_get_determinant.o umfpack_dl_numeric.o umfpack_dl_qsymbolic.o umfpack_dl_report_control.o umfpack_dl_report_info.o umfpack_dl_report_matrix.o umfpack_dl_report_numeric.o umfpack_dl_report_perm.o umfpack_dl_report_status.o umfpack_dl_report_symbolic.o umfpack_dl_report_triplet.o umfpack_dl_report_vector.o umfpack_dl_solve.o umfpack_dl_symbolic.o umfpack_dl_transpose.o umfpack_dl_triplet_to_col.o umfpack_dl_scale.o umfpack_dl_load_numeric.o umfpack_dl_save_numeric.o umfpack_dl_load_symbolic.o umfpack_dl_save_symbolic.o umf_zi_lhsolve.o umf_zi_uhsolve.o umf_zi_triplet_map_nox.o umf_zi_triplet_nomap_x.o umf_zi_triplet_nomap_nox.o umf_zi_triplet_map_x.o umf_zi_assemble_fixq.o umf_zi_store_lu_drop.o umf_zi_assemble.o umf_zi_blas3_update.o umf_zi_build_tuples.o umf_zi_create_element.o umf_zi_dump.o umf_zi_extend_front.o umf_zi_garbage_collection.o umf_zi_get_memory.o umf_zi_init_front.o umf_zi_kernel.o umf_zi_kernel_init.o umf_zi_kernel_wrapup.o umf_zi_local_search.o umf_zi_lsolve.o umf_zi_ltsolve.o umf_zi_mem_alloc_element.o umf_zi_mem_alloc_head_block.o umf_zi_mem_alloc_tail_block.o umf_zi_mem_free_tail_block.o umf_zi_mem_init_memoryspace.o umf_zi_report_vector.o umf_zi_row_search.o umf_zi_scale_column.o umf_zi_set_stats.o umf_zi_solve.o umf_zi_symbolic_usage.o umf_zi_transpose.o umf_zi_tuple_lengths.o umf_zi_usolve.o umf_zi_utsolve.o umf_zi_valid_numeric.o umf_zi_valid_symbolic.o umf_zi_grow_front.o umf_zi_start_front.o umf_zi_store_lu.o umf_zi_scale.o umfpack_zi_wsolve.o umfpack_zi_col_to_triplet.o umfpack_zi_defaults.o umfpack_zi_free_numeric.o umfpack_zi_free_symbolic.o umfpack_zi_get_numeric.o umfpack_zi_get_lunz.o umfpack_zi_get_symbolic.o umfpack_zi_get_determinant.o umfpack_zi_numeric.o umfpack_zi_qsymbolic.o umfpack_zi_report_control.o umfpack_zi_report_info.o umfpack_zi_report_matrix.o umfpack_zi_report_numeric.o umfpack_zi_report_perm.o umfpack_zi_report_status.o umfpack_zi_report_symbolic.o umfpack_zi_report_triplet.o umfpack_zi_report_vector.o umfpack_zi_solve.o umfpack_zi_symbolic.o umfpack_zi_transpose.o umfpack_zi_triplet_to_col.o umfpack_zi_scale.o umfpack_zi_load_numeric.o umfpack_zi_save_numeric.o umfpack_zi_load_symbolic.o umfpack_zi_save_symbolic.o umf_zl_lhsolve.o umf_zl_uhsolve.o umf_zl_triplet_map_nox.o umf_zl_triplet_nomap_x.o umf_zl_triplet_nomap_nox.o umf_zl_triplet_map_x.o umf_zl_assemble_fixq.o umf_zl_store_lu_drop.o umf_zl_assemble.o umf_zl_blas3_update.o umf_zl_build_tuples.o umf_zl_create_element.o umf_zl_dump.o umf_zl_extend_front.o umf_zl_garbage_collection.o umf_zl_get_memory.o umf_zl_init_front.o umf_zl_kernel.o umf_zl_kernel_init.o umf_zl_kernel_wrapup.o umf_zl_local_search.o umf_zl_lsolve.o umf_zl_ltsolve.o umf_zl_mem_alloc_element.o umf_zl_mem_alloc_head_block.o umf_zl_mem_alloc_tail_block.o umf_zl_mem_free_tail_block.o umf_zl_mem_init_memoryspace.o umf_zl_report_vector.o umf_zl_row_search.o umf_zl_scale_column.o umf_zl_set_stats.o umf_zl_solve.o umf_zl_symbolic_usage.o umf_zl_transpose.o umf_zl_tuple_lengths.o umf_zl_usolve.o umf_zl_utsolve.o umf_zl_valid_numeric.o umf_zl_valid_symbolic.o umf_zl_grow_front.o umf_zl_start_front.o umf_zl_store_lu.o umf_zl_scale.o umfpack_zl_wsolve.o umfpack_zl_col_to_triplet.o umfpack_zl_defaults.o umfpack_zl_free_numeric.o umfpack_zl_free_symbolic.o umfpack_zl_get_numeric.o umfpack_zl_get_lunz.o umfpack_zl_get_symbolic.o umfpack_zl_get_determinant.o umfpack_zl_numeric.o umfpack_zl_qsymbolic.o umfpack_zl_report_control.o umfpack_zl_report_info.o umfpack_zl_report_matrix.o umfpack_zl_report_numeric.o umfpack_zl_report_perm.o umfpack_zl_report_status.o umfpack_zl_report_symbolic.o umfpack_zl_report_triplet.o umfpack_zl_report_vector.o umfpack_zl_solve.o umfpack_zl_symbolic.o umfpack_zl_transpose.o umfpack_zl_triplet_to_col.o umfpack_zl_scale.o umfpack_zl_load_numeric.o umfpack_zl_save_numeric.o umfpack_zl_load_symbolic.o umfpack_zl_save_symbolic.o
cd ../../CSparse/Lib
gcc     -O -I../Include -c ../Source/cs_add.c
gcc     -O -I../Include -c ../Source/cs_amd.c
gcc     -O -I../Include -c ../Source/cs_chol.c
gcc     -O -I../Include -c ../Source/cs_cholsol.c
gcc     -O -I../Include -c ../Source/cs_counts.c
gcc     -O -I../Include -c ../Source/cs_cumsum.c
gcc     -O -I../Include -c ../Source/cs_droptol.c
gcc     -O -I../Include -c ../Source/cs_dropzeros.c
gcc     -O -I../Include -c ../Source/cs_dupl.c
gcc     -O -I../Include -c ../Source/cs_entry.c
gcc     -O -I../Include -c ../Source/cs_etree.c
gcc     -O -I../Include -c ../Source/cs_fkeep.c
gcc     -O -I../Include -c ../Source/cs_gaxpy.c
gcc     -O -I../Include -c ../Source/cs_happly.c
gcc     -O -I../Include -c ../Source/cs_house.c
gcc     -O -I../Include -c ../Source/cs_ipvec.c
gcc     -O -I../Include -c ../Source/cs_lsolve.c
gcc     -O -I../Include -c ../Source/cs_ltsolve.c
gcc     -O -I../Include -c ../Source/cs_lu.c
gcc     -O -I../Include -c ../Source/cs_lusol.c
gcc     -O -I../Include -c ../Source/cs_util.c
gcc     -O -I../Include -c ../Source/cs_multiply.c
gcc     -O -I../Include -c ../Source/cs_permute.c
gcc     -O -I../Include -c ../Source/cs_pinv.c
gcc     -O -I../Include -c ../Source/cs_post.c
gcc     -O -I../Include -c ../Source/cs_pvec.c
gcc     -O -I../Include -c ../Source/cs_qr.c
gcc     -O -I../Include -c ../Source/cs_qrsol.c
gcc     -O -I../Include -c ../Source/cs_scatter.c
gcc     -O -I../Include -c ../Source/cs_schol.c
gcc     -O -I../Include -c ../Source/cs_sqr.c
gcc     -O -I../Include -c ../Source/cs_symperm.c
gcc     -O -I../Include -c ../Source/cs_tdfs.c
gcc     -O -I../Include -c ../Source/cs_malloc.c
gcc     -O -I../Include -c ../Source/cs_transpose.c
gcc     -O -I../Include -c ../Source/cs_compress.c
gcc     -O -I../Include -c ../Source/cs_usolve.c
gcc     -O -I../Include -c ../Source/cs_utsolve.c
gcc     -O -I../Include -c ../Source/cs_scc.c
gcc     -O -I../Include -c ../Source/cs_maxtrans.c
gcc     -O -I../Include -c ../Source/cs_dmperm.c
gcc     -O -I../Include -c ../Source/cs_updown.c
gcc     -O -I../Include -c ../Source/cs_print.c
gcc     -O -I../Include -c ../Source/cs_norm.c
gcc     -O -I../Include -c ../Source/cs_load.c
gcc     -O -I../Include -c ../Source/cs_dfs.c
gcc     -O -I../Include -c ../Source/cs_reach.c
gcc     -O -I../Include -c ../Source/cs_spsolve.c
gcc     -O -I../Include -c ../Source/cs_ereach.c
gcc     -O -I../Include -c ../Source/cs_leaf.c
gcc     -O -I../Include -c ../Source/cs_randperm.c
ar rs  libcsparse.a cs_add.o cs_amd.o cs_chol.o cs_cholsol.o cs_counts.o cs_cumsum.o cs_droptol.o cs_dropzeros.o cs_dupl.o cs_entry.o cs_etree.o cs_fkeep.o cs_gaxpy.o cs_happly.o cs_house.o cs_ipvec.o cs_lsolve.o cs_ltsolve.o cs_lu.o cs_lusol.o cs_util.o cs_multiply.o cs_permute.o cs_pinv.o cs_post.o cs_pvec.o cs_qr.o cs_qrsol.o cs_scatter.o cs_schol.o cs_sqr.o cs_symperm.o cs_tdfs.o cs_malloc.o cs_transpose.o cs_compress.o cs_usolve.o cs_utsolve.o cs_scc.o cs_maxtrans.o cs_dmperm.o cs_updown.o cs_print.o cs_norm.o cs_load.o cs_dfs.o cs_reach.o cs_spsolve.o cs_ereach.o cs_leaf.o cs_randperm.o
cd ../../CXSparse/Lib
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_convert.c -o cs_convert.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_add.c -o cs_add_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_amd.c -o cs_amd_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_chol.c -o cs_chol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_cholsol.c -o cs_cholsol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_counts.c -o cs_counts_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_cumsum.c -o cs_cumsum_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_droptol.c -o cs_droptol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_dropzeros.c -o cs_dropzeros_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_dupl.c -o cs_dupl_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_entry.c -o cs_entry_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_etree.c -o cs_etree_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_fkeep.c -o cs_fkeep_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_gaxpy.c -o cs_gaxpy_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_happly.c -o cs_happly_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_house.c -o cs_house_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_ipvec.c -o cs_ipvec_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_lsolve.c -o cs_lsolve_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_ltsolve.c -o cs_ltsolve_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_lu.c -o cs_lu_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_lusol.c -o cs_lusol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_util.c -o cs_util_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_multiply.c -o cs_multiply_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_permute.c -o cs_permute_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_pinv.c -o cs_pinv_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_post.c -o cs_post_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_pvec.c -o cs_pvec_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_qr.c -o cs_qr_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_qrsol.c -o cs_qrsol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_scatter.c -o cs_scatter_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_schol.c -o cs_schol_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_sqr.c -o cs_sqr_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_symperm.c -o cs_symperm_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_tdfs.c -o cs_tdfs_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_malloc.c -o cs_malloc_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_transpose.c -o cs_transpose_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_compress.c -o cs_compress_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_usolve.c -o cs_usolve_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_utsolve.c -o cs_utsolve_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_scc.c -o cs_scc_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_maxtrans.c -o cs_maxtrans_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_dmperm.c -o cs_dmperm_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_updown.c -o cs_updown_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_print.c -o cs_print_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_norm.c -o cs_norm_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_load.c -o cs_load_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_dfs.c -o cs_dfs_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_reach.c -o cs_reach_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_spsolve.c -o cs_spsolve_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_leaf.c -o cs_leaf_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_ereach.c -o cs_ereach_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -c ../Source/cs_randperm.c -o cs_randperm_di.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_add.c -o cs_add_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_amd.c -o cs_amd_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_chol.c -o cs_chol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_cholsol.c -o cs_cholsol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_counts.c -o cs_counts_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_cumsum.c -o cs_cumsum_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_droptol.c -o cs_droptol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_dropzeros.c -o cs_dropzeros_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_dupl.c -o cs_dupl_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_entry.c -o cs_entry_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_etree.c -o cs_etree_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_fkeep.c -o cs_fkeep_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_gaxpy.c -o cs_gaxpy_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_happly.c -o cs_happly_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_house.c -o cs_house_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_ipvec.c -o cs_ipvec_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_lsolve.c -o cs_lsolve_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_ltsolve.c -o cs_ltsolve_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_lu.c -o cs_lu_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_lusol.c -o cs_lusol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_util.c -o cs_util_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_multiply.c -o cs_multiply_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_permute.c -o cs_permute_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_pinv.c -o cs_pinv_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_post.c -o cs_post_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_pvec.c -o cs_pvec_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_qr.c -o cs_qr_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_qrsol.c -o cs_qrsol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_scatter.c -o cs_scatter_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_schol.c -o cs_schol_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_sqr.c -o cs_sqr_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_symperm.c -o cs_symperm_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_tdfs.c -o cs_tdfs_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_malloc.c -o cs_malloc_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_transpose.c -o cs_transpose_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_compress.c -o cs_compress_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_usolve.c -o cs_usolve_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_utsolve.c -o cs_utsolve_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_scc.c -o cs_scc_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_maxtrans.c -o cs_maxtrans_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_dmperm.c -o cs_dmperm_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_updown.c -o cs_updown_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_print.c -o cs_print_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_norm.c -o cs_norm_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_load.c -o cs_load_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_dfs.c -o cs_dfs_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_reach.c -o cs_reach_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_spsolve.c -o cs_spsolve_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_leaf.c -o cs_leaf_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_ereach.c -o cs_ereach_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -c ../Source/cs_randperm.c -o cs_randperm_dl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_add.c -o cs_add_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_amd.c -o cs_amd_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_chol.c -o cs_chol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_cholsol.c -o cs_cholsol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_counts.c -o cs_counts_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_cumsum.c -o cs_cumsum_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_droptol.c -o cs_droptol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_dropzeros.c -o cs_dropzeros_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_dupl.c -o cs_dupl_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_entry.c -o cs_entry_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_etree.c -o cs_etree_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_fkeep.c -o cs_fkeep_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_gaxpy.c -o cs_gaxpy_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_happly.c -o cs_happly_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_house.c -o cs_house_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_ipvec.c -o cs_ipvec_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_lsolve.c -o cs_lsolve_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_ltsolve.c -o cs_ltsolve_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_lu.c -o cs_lu_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_lusol.c -o cs_lusol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_util.c -o cs_util_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_multiply.c -o cs_multiply_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_permute.c -o cs_permute_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_pinv.c -o cs_pinv_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_post.c -o cs_post_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_pvec.c -o cs_pvec_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_qr.c -o cs_qr_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_qrsol.c -o cs_qrsol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_scatter.c -o cs_scatter_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_schol.c -o cs_schol_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_sqr.c -o cs_sqr_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_symperm.c -o cs_symperm_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_tdfs.c -o cs_tdfs_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_malloc.c -o cs_malloc_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_transpose.c -o cs_transpose_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_compress.c -o cs_compress_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_usolve.c -o cs_usolve_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_utsolve.c -o cs_utsolve_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_scc.c -o cs_scc_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_maxtrans.c -o cs_maxtrans_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_dmperm.c -o cs_dmperm_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_updown.c -o cs_updown_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_print.c -o cs_print_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_norm.c -o cs_norm_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_load.c -o cs_load_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_dfs.c -o cs_dfs_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_reach.c -o cs_reach_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_spsolve.c -o cs_spsolve_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_leaf.c -o cs_leaf_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_ereach.c -o cs_ereach_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_COMPLEX -c ../Source/cs_randperm.c -o cs_randperm_ci.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_add.c -o cs_add_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_amd.c -o cs_amd_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_chol.c -o cs_chol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_cholsol.c -o cs_cholsol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_counts.c -o cs_counts_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_cumsum.c -o cs_cumsum_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_droptol.c -o cs_droptol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_dropzeros.c -o cs_dropzeros_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_dupl.c -o cs_dupl_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_entry.c -o cs_entry_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_etree.c -o cs_etree_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_fkeep.c -o cs_fkeep_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_gaxpy.c -o cs_gaxpy_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_happly.c -o cs_happly_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_house.c -o cs_house_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_ipvec.c -o cs_ipvec_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_lsolve.c -o cs_lsolve_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_ltsolve.c -o cs_ltsolve_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_lu.c -o cs_lu_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_lusol.c -o cs_lusol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_util.c -o cs_util_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_multiply.c -o cs_multiply_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_permute.c -o cs_permute_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_pinv.c -o cs_pinv_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_post.c -o cs_post_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_pvec.c -o cs_pvec_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_qr.c -o cs_qr_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_qrsol.c -o cs_qrsol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_scatter.c -o cs_scatter_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_schol.c -o cs_schol_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_sqr.c -o cs_sqr_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_symperm.c -o cs_symperm_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_tdfs.c -o cs_tdfs_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_malloc.c -o cs_malloc_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_transpose.c -o cs_transpose_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_compress.c -o cs_compress_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_usolve.c -o cs_usolve_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_utsolve.c -o cs_utsolve_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_scc.c -o cs_scc_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_maxtrans.c -o cs_maxtrans_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_dmperm.c -o cs_dmperm_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_updown.c -o cs_updown_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_print.c -o cs_print_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_norm.c -o cs_norm_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_load.c -o cs_load_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_dfs.c -o cs_dfs_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_reach.c -o cs_reach_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_spsolve.c -o cs_spsolve_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_leaf.c -o cs_leaf_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_ereach.c -o cs_ereach_cl.o
gcc -O3 -fexceptions -fPIC -I../../SuiteSparse_config -I../Include -DCS_LONG -DCS_COMPLEX -c ../Source/cs_randperm.c -o cs_randperm_cl.o
ar rs  libcxsparse.a cs_convert.o cs_add_di.o cs_amd_di.o cs_chol_di.o cs_cholsol_di.o cs_counts_di.o cs_cumsum_di.o cs_droptol_di.o cs_dropzeros_di.o cs_dupl_di.o cs_entry_di.o cs_etree_di.o cs_fkeep_di.o cs_gaxpy_di.o cs_happly_di.o cs_house_di.o cs_ipvec_di.o cs_lsolve_di.o cs_ltsolve_di.o cs_lu_di.o cs_lusol_di.o cs_util_di.o cs_multiply_di.o cs_permute_di.o cs_pinv_di.o cs_post_di.o cs_pvec_di.o cs_qr_di.o cs_qrsol_di.o cs_scatter_di.o cs_schol_di.o cs_sqr_di.o cs_symperm_di.o cs_tdfs_di.o cs_malloc_di.o cs_transpose_di.o cs_compress_di.o cs_usolve_di.o cs_utsolve_di.o cs_scc_di.o cs_maxtrans_di.o cs_dmperm_di.o cs_updown_di.o cs_print_di.o cs_norm_di.o cs_load_di.o cs_dfs_di.o cs_reach_di.o cs_spsolve_di.o cs_leaf_di.o cs_ereach_di.o cs_randperm_di.o cs_add_dl.o cs_amd_dl.o cs_chol_dl.o cs_cholsol_dl.o cs_counts_dl.o cs_cumsum_dl.o cs_droptol_dl.o cs_dropzeros_dl.o cs_dupl_dl.o cs_entry_dl.o cs_etree_dl.o cs_fkeep_dl.o cs_gaxpy_dl.o cs_happly_dl.o cs_house_dl.o cs_ipvec_dl.o cs_lsolve_dl.o cs_ltsolve_dl.o cs_lu_dl.o cs_lusol_dl.o cs_util_dl.o cs_multiply_dl.o cs_permute_dl.o cs_pinv_dl.o cs_post_dl.o cs_pvec_dl.o cs_qr_dl.o cs_qrsol_dl.o cs_scatter_dl.o cs_schol_dl.o cs_sqr_dl.o cs_symperm_dl.o cs_tdfs_dl.o cs_malloc_dl.o cs_transpose_dl.o cs_compress_dl.o cs_usolve_dl.o cs_utsolve_dl.o cs_scc_dl.o cs_maxtrans_dl.o cs_dmperm_dl.o cs_updown_dl.o cs_print_dl.o cs_norm_dl.o cs_load_dl.o cs_dfs_dl.o cs_reach_dl.o cs_spsolve_dl.o cs_leaf_dl.o cs_ereach_dl.o cs_randperm_dl.o cs_add_ci.o cs_amd_ci.o cs_chol_ci.o cs_cholsol_ci.o cs_counts_ci.o cs_cumsum_ci.o cs_droptol_ci.o cs_dropzeros_ci.o cs_dupl_ci.o cs_entry_ci.o cs_etree_ci.o cs_fkeep_ci.o cs_gaxpy_ci.o cs_happly_ci.o cs_house_ci.o cs_ipvec_ci.o cs_lsolve_ci.o cs_ltsolve_ci.o cs_lu_ci.o cs_lusol_ci.o cs_util_ci.o cs_multiply_ci.o cs_permute_ci.o cs_pinv_ci.o cs_post_ci.o cs_pvec_ci.o cs_qr_ci.o cs_qrsol_ci.o cs_scatter_ci.o cs_schol_ci.o cs_sqr_ci.o cs_symperm_ci.o cs_tdfs_ci.o cs_malloc_ci.o cs_transpose_ci.o cs_compress_ci.o cs_usolve_ci.o cs_utsolve_ci.o cs_scc_ci.o cs_maxtrans_ci.o cs_dmperm_ci.o cs_updown_ci.o cs_print_ci.o cs_norm_ci.o cs_load_ci.o cs_dfs_ci.o cs_reach_ci.o cs_spsolve_ci.o cs_leaf_ci.o cs_ereach_ci.o cs_randperm_ci.o cs_add_cl.o cs_amd_cl.o cs_chol_cl.o cs_cholsol_cl.o cs_counts_cl.o cs_cumsum_cl.o cs_droptol_cl.o cs_dropzeros_cl.o cs_dupl_cl.o cs_entry_cl.o cs_etree_cl.o cs_fkeep_cl.o cs_gaxpy_cl.o cs_happly_cl.o cs_house_cl.o cs_ipvec_cl.o cs_lsolve_cl.o cs_ltsolve_cl.o cs_lu_cl.o cs_lusol_cl.o cs_util_cl.o cs_multiply_cl.o cs_permute_cl.o cs_pinv_cl.o cs_post_cl.o cs_pvec_cl.o cs_qr_cl.o cs_qrsol_cl.o cs_scatter_cl.o cs_schol_cl.o cs_sqr_cl.o cs_symperm_cl.o cs_tdfs_cl.o cs_malloc_cl.o cs_transpose_cl.o cs_compress_cl.o cs_usolve_cl.o cs_utsolve_cl.o cs_scc_cl.o cs_maxtrans_cl.o cs_dmperm_cl.o cs_updown_cl.o cs_print_cl.o cs_norm_cl.o cs_load_cl.o cs_dfs_cl.o cs_reach_cl.o cs_spsolve_cl.o cs_leaf_cl.o cs_ereach_cl.o cs_randperm_cl.o
cd ../../RBio/Lib
gcc -O3 -fexceptions -fPIC -c -I../Include -I../../SuiteSparse_config ../Source/RBio.c
ar rs  librbio.a RBio.o
cd ../../SPQR/Lib
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_rmap.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/SuiteSparseQR_C.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/SuiteSparseQR_expert.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_parallel.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_kernel.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_analyze.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_assemble.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_cpack.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_csize.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_fcsize.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_debug.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_front.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_factorize.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_freenum.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_freesym.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_freefac.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_fsize.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_maxcolnorm.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_rconvert.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_rcount.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_rhpack.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_rsolve.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_stranspose1.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_stranspose2.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_hpinv.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_1fixed.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_1colamd.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/SuiteSparseQR.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_1factor.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_cumsum.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_shift.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_happly.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_panel.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_happly_work.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/SuiteSparseQR_qmult.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_trapezoidal.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_larftb.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_append.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_type.cpp
g++ -O3 -fexceptions -fPIC  -DNPARTITION -I../../CHOLMOD/Include -I../../SuiteSparse_config -I../Include -c ../Source/spqr_tol.cpp
ar rs  libspqr.a spqr_rmap.o SuiteSparseQR_C.o SuiteSparseQR_expert.o spqr_parallel.o spqr_kernel.o spqr_analyze.o spqr_assemble.o spqr_cpack.o spqr_csize.o spqr_fcsize.o spqr_debug.o spqr_front.o spqr_factorize.o spqr_freenum.o spqr_freesym.o spqr_freefac.o spqr_fsize.o spqr_maxcolnorm.o spqr_rconvert.o spqr_rcount.o spqr_rhpack.o spqr_rsolve.o spqr_stranspose1.o spqr_stranspose2.o spqr_hpinv.o spqr_1fixed.o spqr_1colamd.o SuiteSparseQR.o spqr_1factor.o spqr_cumsum.o spqr_shift.o spqr_happly.o spqr_panel.o spqr_happly_work.o SuiteSparseQR_qmult.o spqr_trapezoidal.o spqr_larftb.o spqr_append.o spqr_type.o spqr_tol.o
cd ../../..
gcc -o mwe mwe.c SuiteSparse/UMFPACK/Lib/libumfpack.a \
  SuiteSparse/CHOLMOD/Lib/libcholmod.a \
  SuiteSparse/AMD/Lib/libamd.a \
  SuiteSparse/COLAMD/Lib/libcolamd.a \
  SuiteSparse/SuiteSparse_config/libsuitesparseconfig.a \
  /usr/lib/libblas.so.3 -lm
