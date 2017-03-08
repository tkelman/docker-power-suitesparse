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
ar rs  libumfpack.a umf_l_analyze.o umf_l_apply_order.o umf_l_colamd.o umf_l_free.o umf_l_fsize.o umf_l_is_permutation.o umf_l_malloc.o umf_l_realloc.o umf_l_report_perm.o umf_l_singletons.o umf_l_cholmod.o umfpack_gn_timer.o umfpack_gn_tictoc.o umf_dl_lhsolve.o umf_dl_uhsolve.o umf_dl_triplet_map_nox.o umf_dl_triplet_nomap_x.o umf_dl_triplet_nomap_nox.o umf_dl_triplet_map_x.o umf_dl_assemble_fixq.o umf_dl_store_lu_drop.o umf_dl_assemble.o umf_dl_blas3_update.o umf_dl_build_tuples.o umf_dl_create_element.o umf_dl_dump.o umf_dl_extend_front.o umf_dl_garbage_collection.o umf_dl_get_memory.o umf_dl_init_front.o umf_dl_kernel.o umf_dl_kernel_init.o umf_dl_kernel_wrapup.o umf_dl_local_search.o umf_dl_lsolve.o umf_dl_ltsolve.o umf_dl_mem_alloc_element.o umf_dl_mem_alloc_head_block.o umf_dl_mem_alloc_tail_block.o umf_dl_mem_free_tail_block.o umf_dl_mem_init_memoryspace.o umf_dl_report_vector.o umf_dl_row_search.o umf_dl_scale_column.o umf_dl_set_stats.o umf_dl_solve.o umf_dl_symbolic_usage.o umf_dl_transpose.o umf_dl_tuple_lengths.o umf_dl_usolve.o umf_dl_utsolve.o umf_dl_valid_numeric.o umf_dl_valid_symbolic.o umf_dl_grow_front.o umf_dl_start_front.o umf_dl_store_lu.o umf_dl_scale.o umfpack_dl_wsolve.o umfpack_dl_col_to_triplet.o umfpack_dl_defaults.o umfpack_dl_free_numeric.o umfpack_dl_free_symbolic.o umfpack_dl_get_numeric.o umfpack_dl_get_lunz.o umfpack_dl_get_symbolic.o umfpack_dl_get_determinant.o umfpack_dl_numeric.o umfpack_dl_qsymbolic.o umfpack_dl_report_control.o umfpack_dl_report_info.o umfpack_dl_report_matrix.o umfpack_dl_report_numeric.o umfpack_dl_report_perm.o umfpack_dl_report_status.o umfpack_dl_report_symbolic.o umfpack_dl_report_triplet.o umfpack_dl_report_vector.o umfpack_dl_solve.o umfpack_dl_symbolic.o umfpack_dl_transpose.o umfpack_dl_triplet_to_col.o umfpack_dl_scale.o umfpack_dl_load_numeric.o umfpack_dl_save_numeric.o umfpack_dl_load_symbolic.o umfpack_dl_save_symbolic.o umf_zi_lhsolve.o umf_zi_uhsolve.o umf_zi_triplet_map_nox.o umf_zi_triplet_nomap_x.o umf_zi_triplet_nomap_nox.o umf_zi_triplet_map_x.o umf_zi_assemble_fixq.o umf_zi_store_lu_drop.o umf_zi_assemble.o umf_zi_blas3_update.o umf_zi_build_tuples.o umf_zi_create_element.o umf_zi_dump.o umf_zi_extend_front.o umf_zi_garbage_collection.o umf_zi_get_memory.o umf_zi_init_front.o umf_zi_kernel.o umf_zi_kernel_init.o umf_zi_kernel_wrapup.o umf_zi_local_search.o umf_zi_lsolve.o umf_zi_ltsolve.o umf_zi_mem_alloc_element.o umf_zi_mem_alloc_head_block.o umf_zi_mem_alloc_tail_block.o umf_zi_mem_free_tail_block.o umf_zi_mem_init_memoryspace.o umf_zi_report_vector.o umf_zi_row_search.o umf_zi_scale_column.o umf_zi_set_stats.o umf_zi_solve.o umf_zi_symbolic_usage.o umf_zi_transpose.o umf_zi_tuple_lengths.o umf_zi_usolve.o umf_zi_utsolve.o umf_zi_valid_numeric.o umf_zi_valid_symbolic.o umf_zi_grow_front.o umf_zi_start_front.o umf_zi_store_lu.o umf_zi_scale.o umfpack_zi_wsolve.o umfpack_zi_col_to_triplet.o umfpack_zi_defaults.o umfpack_zi_free_numeric.o umfpack_zi_free_symbolic.o umfpack_zi_get_numeric.o umfpack_zi_get_lunz.o umfpack_zi_get_symbolic.o umfpack_zi_get_determinant.o umfpack_zi_numeric.o umfpack_zi_qsymbolic.o umfpack_zi_report_control.o umfpack_zi_report_info.o umfpack_zi_report_matrix.o umfpack_zi_report_numeric.o umfpack_zi_report_perm.o umfpack_zi_report_status.o umfpack_zi_report_symbolic.o umfpack_zi_report_triplet.o umfpack_zi_report_vector.o umfpack_zi_solve.o umfpack_zi_symbolic.o umfpack_zi_transpose.o umfpack_zi_triplet_to_col.o umfpack_zi_scale.o umfpack_zi_load_numeric.o umfpack_zi_save_numeric.o umfpack_zi_load_symbolic.o umfpack_zi_save_symbolic.o umf_zl_lhsolve.o umf_zl_uhsolve.o umf_zl_triplet_map_nox.o umf_zl_triplet_nomap_x.o umf_zl_triplet_nomap_nox.o umf_zl_triplet_map_x.o umf_zl_assemble_fixq.o umf_zl_store_lu_drop.o umf_zl_assemble.o umf_zl_blas3_update.o umf_zl_build_tuples.o umf_zl_create_element.o umf_zl_dump.o umf_zl_extend_front.o umf_zl_garbage_collection.o umf_zl_get_memory.o umf_zl_init_front.o umf_zl_kernel.o umf_zl_kernel_init.o umf_zl_kernel_wrapup.o umf_zl_local_search.o umf_zl_lsolve.o umf_zl_ltsolve.o umf_zl_mem_alloc_element.o umf_zl_mem_alloc_head_block.o umf_zl_mem_alloc_tail_block.o umf_zl_mem_free_tail_block.o umf_zl_mem_init_memoryspace.o umf_zl_report_vector.o umf_zl_row_search.o umf_zl_scale_column.o umf_zl_set_stats.o umf_zl_solve.o umf_zl_symbolic_usage.o umf_zl_transpose.o umf_zl_tuple_lengths.o umf_zl_usolve.o umf_zl_utsolve.o umf_zl_valid_numeric.o umf_zl_valid_symbolic.o umf_zl_grow_front.o umf_zl_start_front.o umf_zl_store_lu.o umf_zl_scale.o umfpack_zl_wsolve.o umfpack_zl_col_to_triplet.o umfpack_zl_defaults.o umfpack_zl_free_numeric.o umfpack_zl_free_symbolic.o umfpack_zl_get_numeric.o umfpack_zl_get_lunz.o umfpack_zl_get_symbolic.o umfpack_zl_get_determinant.o umfpack_zl_numeric.o umfpack_zl_qsymbolic.o umfpack_zl_report_control.o umfpack_zl_report_info.o umfpack_zl_report_matrix.o umfpack_zl_report_numeric.o umfpack_zl_report_perm.o umfpack_zl_report_status.o umfpack_zl_report_symbolic.o umfpack_zl_report_triplet.o umfpack_zl_report_vector.o umfpack_zl_solve.o umfpack_zl_symbolic.o umfpack_zl_transpose.o umfpack_zl_triplet_to_col.o umfpack_zl_scale.o umfpack_zl_load_numeric.o umfpack_zl_save_numeric.o umfpack_zl_load_symbolic.o umfpack_zl_save_symbolic.o
cd ../../..
gcc -O3 -o mwe mwe.c \
  SuiteSparse/UMFPACK/Lib/libumfpack.a \
  SuiteSparse/CHOLMOD/Lib/libcholmod.a \
  SuiteSparse/AMD/Lib/libamd.a \
  SuiteSparse/COLAMD/Lib/libcolamd.a \
  SuiteSparse/SuiteSparse_config/libsuitesparseconfig.a \
  /usr/lib/libblas.so.3 -lm
