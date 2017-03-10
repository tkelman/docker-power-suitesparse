          ******** /home/test/umfpack_tictoc.i ********

umfpack_tic() {}

          ******** /home/test/umfpack_zl_symbolic.i ********

umfpack_zl_symbolic() {}

          ******** /home/test/mwe.i ********

a[], c[];
b, d, e;
void main() {
  umfpack_zl_symbolic(b, e, c, d);
  umfpack_zl_numeric(a, b, e, c, d);
}

          ******** /home/test/umfpack_zl_numeric.i ********

typedef struct { double a } b;
long umfpack_zl_numeric(void *c, double d[]) {
  b *e;
  long f;
  umfpack_tic();
  if (d)
    e = c;
  if (!c)
    return -4;
  if (e->a)
    return 0;
  return f;
}

