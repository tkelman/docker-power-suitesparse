==> ../SuiteSparse_config.i <==
malloc();
SuiteSparse_malloc() { malloc(); }

==> ../amd_2.i <==

==> ../amd_aat.i <==

==> ../amd_defaults.i <==

==> ../amd_post_tree.i <==

==> ../amd_postorder.i <==

==> ../amd_valid.i <==

==> ../cholmod_aat.i <==

==> ../cholmod_amd.i <==

==> ../cholmod_analyze.i <==

==> ../cholmod_band.i <==

==> ../cholmod_change_factor.i <==

==> ../cholmod_check.i <==

==> ../cholmod_colamd.i <==

==> ../cholmod_common.i <==

==> ../cholmod_copy.i <==

==> ../cholmod_error.i <==

==> ../cholmod_etree.i <==

==> ../cholmod_factor.i <==

==> ../cholmod_memory.i <==

==> ../cholmod_postorder.i <==

==> ../cholmod_rowcolcounts.i <==

==> ../cholmod_sparse.i <==

==> ../cholmod_super_symbolic.i <==

==> ../cholmod_transpose.i <==

==> ../colamd.i <==

==> ../mwe.i <==
main() {
  umfpack_zl_symbolic();
  umfpack_zl_numeric();
}

==> ../umf_analyze.i <==

==> ../umf_apply_order.i <==

==> ../umf_cholmod.i <==

==> ../umf_colamd.i <==

==> ../umf_free.i <==

==> ../umf_fsize.i <==

==> ../umf_is_permutation.i <==

==> ../umf_malloc.i <==
umf_l_malloc() { SuiteSparse_malloc(); }

==> ../umf_realloc.i <==

==> ../umf_singletons.i <==

==> ../umf_zl_assemble.i <==

==> ../umf_zl_assemble_fixq.i <==

==> ../umf_zl_blas3_update.i <==

==> ../umf_zl_build_tuples.i <==

==> ../umf_zl_create_element.i <==

==> ../umf_zl_extend_front.i <==

==> ../umf_zl_garbage_collection.i <==

==> ../umf_zl_get_memory.i <==

==> ../umf_zl_grow_front.i <==

==> ../umf_zl_init_front.i <==

==> ../umf_zl_kernel.i <==

==> ../umf_zl_kernel_init.i <==

==> ../umf_zl_kernel_wrapup.i <==

==> ../umf_zl_local_search.i <==

==> ../umf_zl_mem_alloc_element.i <==

==> ../umf_zl_mem_alloc_head_block.i <==

==> ../umf_zl_mem_alloc_tail_block.i <==

==> ../umf_zl_mem_free_tail_block.i <==

==> ../umf_zl_mem_init_memoryspace.i <==

==> ../umf_zl_row_search.i <==

==> ../umf_zl_scale.i <==

==> ../umf_zl_scale_column.i <==

==> ../umf_zl_set_stats.i <==

==> ../umf_zl_start_front.i <==

==> ../umf_zl_store_lu.i <==

==> ../umf_zl_store_lu_drop.i <==

==> ../umf_zl_symbolic_usage.i <==

==> ../umf_zl_transpose.i <==

==> ../umf_zl_tuple_lengths.i <==

==> ../umf_zl_valid_symbolic.i <==

==> ../umfpack_tictoc.i <==

==> ../umfpack_zl_free_numeric.i <==

==> ../umfpack_zl_free_symbolic.i <==

==> ../umfpack_zl_numeric.i <==
typedef a;
typedef struct { double b, c, d, e } f;
typedef struct {
  a g, *h;
  long i, j, k, l, m, n, o, p, q;
  long r;
  long s, t, u, v, c, d, e, f, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar,
      as, at, au, av, aw, ax, ay, az, a, b, bc, bd, be, bf, bg, bh, bi, bj, bk,
      bl, bm, bn, bo
} bp;
bt;
bp ce;
f *cf;
bp *w = &ce;
*umf_l_malloc();
bz(f **x) {
  f *cd = umf_l_malloc(sizeof(f));
  *x = cd;
}
umfpack_zl_numeric() {
  double d, e;
  bp cm;
  ce = cm;
  long s = w->s;
  w = umf_l_malloc(bt);
  umf_l_malloc(s);
  w->r = umf_l_malloc(sizeof(long));
  umf_l_malloc();
  bz(&cf);
  cf->b = cf->c = cf->d = d;
  cf->e = e;
}

==> ../umfpack_zl_qsymbolic.i <==
umfpack_zl_qsymbolic() { umf_l_malloc(); }

==> ../umfpack_zl_symbolic.i <==
umfpack_zl_symbolic() { umfpack_zl_qsymbolic(); }
