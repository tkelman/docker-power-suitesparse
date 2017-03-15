==> SuiteSparse_config.i <==
malloc();
SuiteSparse_malloc() { malloc(); }

==> mwe.i <==
main() { umfpack_zl_symbolic(); }

==> umf_analyze.i <==
a;
*b;
umf_l_analyze() { *b = a; }

==> umf_malloc.i <==
umf_l_malloc() { SuiteSparse_malloc(); }

==> umfpack_zl_qsymbolic.i <==
typedef struct { long a, b, c, d, e, g, h, f } j;
j *k;
l;
*umf_l_malloc();
umfpack_zl_qsymbolic() {
  long e = l, i, a[2], m;
  k = umf_l_malloc();
  k->e = k->g = k->h = k->f = e;
  for (; i; i++)
    m = a[1];
  if (m)
    umf_l_analyze();
}

==> umfpack_zl_symbolic.i <==
umfpack_zl_symbolic() { umfpack_zl_qsymbolic(); }
