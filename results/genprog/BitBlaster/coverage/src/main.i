extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1),
__leaf__)) memset)(void *__s , int __c , unsigned long __n ) ;
struct _IO_FILE;
extern int fprintf(struct _IO_FILE * __restrict  __stream ,
                   char const   * __restrict  __format  , ...) ;
extern struct _IO_FILE *fopen(char const   * __restrict  __filename ,
                              char const   * __restrict  __modes ) ;
extern int fflush(struct _IO_FILE *__stream ) ;
extern int fclose(struct _IO_FILE *__stream ) ;
struct _IO_FILE *_coverage_fout  ;
typedef unsigned long cgc_size_t;
typedef long cgc_ssize_t;
typedef long _fd_mask;
struct __anonstruct_cgc_fd_set_1 {
   _fd_mask _fd_bits[1024UL / (8UL * sizeof(_fd_mask ))] ;
};
typedef struct __anonstruct_cgc_fd_set_1 cgc_fd_set;
struct cgc_timeval {
   int tv_sec ;
   int tv_usec ;
};
struct __anonstruct_jmp_buf_2 {
   long _b[8] ;
};
typedef struct __anonstruct_jmp_buf_2 jmp_buf[1];
typedef unsigned int uint32_t;
typedef unsigned char uint8_t;
extern  __attribute__((__noreturn__)) void cgc__terminate(unsigned int status ) ;
extern int cgc_transmit(int fd , void const   *buf , cgc_size_t count ,
                        cgc_size_t *tx_bytes ) ;
extern int cgc_receive(int fd , void *buf , cgc_size_t count ,
                       cgc_size_t *rx_bytes ) ;
extern int cgc_fdwait(int nfds , cgc_fd_set *readfds , cgc_fd_set *writefds ,
                      struct cgc_timeval  const  *timeout , int *readyfds ) ;
extern int cgc_allocate(cgc_size_t length , int is_X , void **addr ) ;
extern int cgc_deallocate(void *addr , cgc_size_t length ) ;
extern int cgc_random(void *buf , cgc_size_t count , cgc_size_t *rnd_bytes ) ;
extern int cgc_setjmp(struct __anonstruct_jmp_buf_2 * )  __attribute__((__returns_twice__)) ;
extern  __attribute__((__noreturn__)) void cgc_longjmp(struct __anonstruct_jmp_buf_2 * ,
                                                       int  ) ;
extern float cgc_sinf(float  ) ;
extern double cgc_sin(double  ) ;
extern long double cgc_sinl(long double  ) ;
extern float cgc_cosf(float  ) ;
extern double cgc_cos(double  ) ;
extern long double cgc_cosl(long double  ) ;
extern float cgc_tanf(float  ) ;
extern double cgc_tan(double  ) ;
extern long double cgc_tanl(long double  ) ;
extern float cgc_logf(float  ) ;
extern double cgc_log(double  ) ;
extern long double cgc_logl(long double  ) ;
extern float cgc_rintf(float  ) ;
extern double cgc_rint(double  ) ;
extern long double cgc_rintl(long double  ) ;
extern float cgc_sqrtf(float  ) ;
extern double cgc_sqrt(double  ) ;
extern long double cgc_sqrtl(long double  ) ;
extern float cgc_fabsf(float  ) ;
extern double cgc_fabs(double  ) ;
extern long double cgc_fabsl(long double  ) ;
extern float cgc_log2f(float  ) ;
extern double cgc_log2(double  ) ;
extern long double cgc_log2l(long double  ) ;
extern float cgc_exp2f(float  ) ;
extern double cgc_exp2(double  ) ;
extern long double cgc_exp2l(long double  ) ;
extern float cgc_expf(float  ) ;
extern double cgc_exp(double  ) ;
extern long double cgc_expl(long double  ) ;
extern float cgc_log10f(float  ) ;
extern double cgc_log10(double  ) ;
extern long double cgc_log10l(long double  ) ;
extern float cgc_powf(float  , float  ) ;
extern double cgc_pow(double  , double  ) ;
extern long double cgc_powl(long double  , long double  ) ;
extern float cgc_atan2f(float  , float  ) ;
extern double cgc_atan2(double  , double  ) ;
extern long double cgc_atan2l(long double  , long double  ) ;
extern float cgc_remainderf(float  , float  ) ;
extern double cgc_remainder(double  , double  ) ;
extern long double cgc_remainderl(long double  , long double  ) ;
extern float cgc_scalbnf(float  , int  ) ;
extern double cgc_scalbn(double  , int  ) ;
extern long double cgc_scalbnl(long double  , int  ) ;
extern float cgc_scalblnf(float  , long  ) ;
extern double cgc_scalbln(double  , long  ) ;
extern long double cgc_scalblnl(long double  , long  ) ;
extern float cgc_significandf(float  ) ;
extern double cgc_significand(double  ) ;
extern long double cgc_significandl(long double  ) ;
cgc_size_t cgc_transmit_all(int fd , char *buf , cgc_size_t size ) 
{ 
  cgc_size_t rx_bytes ;
  cgc_size_t total ;
  int ret ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "1\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  rx_bytes = (cgc_size_t )0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "2\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  total = (cgc_size_t )0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "3\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  ret = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "4\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if ((unsigned long )buf == (unsigned long )((char *)0)) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "5\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    return ((cgc_size_t )0);
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "6\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }

  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "7\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "8\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    ret = cgc_transmit(fd, (void const   *)buf, size - total, & rx_bytes);
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "9\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (ret != 0) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "10\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return ((cgc_size_t )0);
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "11\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      if (rx_bytes == 0UL) {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "12\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        return ((cgc_size_t )0);
      } else {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "13\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }

      }
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "14\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    total += rx_bytes;
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "15\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (total < size) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "16\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    } else {
      break;
    }
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "18\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return (size);
}
}
cgc_size_t cgc_receive_all(int fd , char *buf , cgc_size_t size ) 
{ 
  cgc_size_t rx_bytes ;
  cgc_size_t total ;
  int ret ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "19\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  rx_bytes = (cgc_size_t )0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "20\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  total = (cgc_size_t )0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "21\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  ret = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "22\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if ((unsigned long )buf == (unsigned long )((char *)0)) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "23\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    return ((cgc_size_t )0);
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "24\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }

  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "25\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "26\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    ret = cgc_receive(fd, (void *)buf, size - total, & rx_bytes);
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "27\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (ret != 0) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "28\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return ((cgc_size_t )0);
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "29\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      if (rx_bytes == 0UL) {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "30\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        return ((cgc_size_t )0);
      } else {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "31\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }

      }
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "32\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    total += rx_bytes;
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "33\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (total < size) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "34\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    } else {
      break;
    }
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "36\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return (size);
}
}
uint32_t gBoard[32]  ;
void cgc_rotate_right(int row ) 
{ 
  uint32_t temp ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "37\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if (row < 0) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "38\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    return;
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "39\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (row >= 32) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "40\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return;
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "41\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "42\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  temp = gBoard[row] >> 31;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "43\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  gBoard[row] = (gBoard[row] << 1) | temp;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "44\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
uint32_t mask[32]  = 
  {      (uint32_t )1,      (uint32_t )2,      (uint32_t )4,      (uint32_t )8, 
        (uint32_t )16,      (uint32_t )32,      (uint32_t )64,      (uint32_t )128, 
        (uint32_t )256,      (uint32_t )512,      (uint32_t )1024,      (uint32_t )2048, 
        (uint32_t )4096,      (uint32_t )8192,      (uint32_t )16384,      (uint32_t )32768, 
        (uint32_t )65536,      (uint32_t )131072,      (uint32_t )262144,      (uint32_t )524288, 
        (uint32_t )1048576,      (uint32_t )2097152,      (uint32_t )4194304,      (uint32_t )8388608, 
        (uint32_t )16777216,      (uint32_t )33554432,      (uint32_t )67108864,      (uint32_t )134217728, 
        (uint32_t )268435456,      (uint32_t )536870912,      (uint32_t )1073741824,      2147483648U};
uint32_t neg_mask[32]  = 
  {      (uint32_t )(~ 1),      (uint32_t )(~ 2),      (uint32_t )(~ 4),      (uint32_t )(~ 8), 
        (uint32_t )(~ 16),      (uint32_t )(~ 32),      (uint32_t )(~ 64),      (uint32_t )(~ 128), 
        (uint32_t )(~ 256),      (uint32_t )(~ 512),      (uint32_t )(~ 1024),      (uint32_t )(~ 2048), 
        (uint32_t )(~ 4096),      (uint32_t )(~ 8192),      (uint32_t )(~ 16384),      (uint32_t )(~ 32768), 
        (uint32_t )(~ 65536),      (uint32_t )(~ 131072),      (uint32_t )(~ 262144),      (uint32_t )(~ 524288), 
        (uint32_t )(~ 1048576),      (uint32_t )(~ 2097152),      (uint32_t )(~ 4194304),      (uint32_t )(~ 8388608), 
        (uint32_t )(~ 16777216),      (uint32_t )(~ 33554432),      (uint32_t )(~ 67108864),      (uint32_t )(~ 134217728), 
        (uint32_t )(~ 268435456),      (uint32_t )(~ 536870912),      (uint32_t )(~ 1073741824),      ~ 2147483648U};
void cgc_rotate_down(int col ) 
{ 
  int i ;
  uint32_t temp ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "45\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "46\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  temp = (uint32_t )0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "47\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if (col < 0) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "48\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    return;
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "49\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (col >= 32) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "50\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return;
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "51\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "52\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  temp = gBoard[31];
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "53\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 31;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "54\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "55\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (i > 0) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "56\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    } else {
      break;
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "58\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    gBoard[i] = (gBoard[i] & neg_mask[col]) | (gBoard[i - 1] & mask[col]);
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "59\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    i --;
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "60\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  gBoard[0] = (gBoard[0] & neg_mask[col]) | (temp & mask[col]);
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "61\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
void cgc_printBoard(void) 
{ 
  int i ;
  int j ;
  int k ;
  char buf[1088] ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "62\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "63\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  j = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "64\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  k = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "65\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "66\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "67\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (i < 32) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "68\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    } else {
      break;
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "70\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    j = 0;
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "71\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    while (1) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "72\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      if (j < 32) {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "73\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }

      } else {
        break;
      }
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "75\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      if (gBoard[i] & mask[j]) {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "76\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        tmp = k;
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "77\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        k ++;
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "78\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        buf[tmp] = (char )'1';
      } else {
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "79\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        tmp___0 = k;
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "80\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        k ++;
        {
        _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                               "a");
        fprintf(_coverage_fout, "81\n");
        fflush(_coverage_fout);
        fclose(_coverage_fout);
        }
        buf[tmp___0] = (char )'.';
      }
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "82\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      j ++;
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "83\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    tmp___1 = k;
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "84\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    k ++;
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "85\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    buf[tmp___1] = (char )'\n';
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "86\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    i ++;
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "87\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  buf[k] = (char )'\000';
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "88\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  cgc_transmit_all(1, buf, (cgc_size_t )k);
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "89\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
void cgc_initBoard(void) 
{ 


  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "90\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  gBoard[31] = 4294967295U;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "91\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  gBoard[30] = 4294967295U;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "92\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
void cgc_remove_bits(void) 
{ 


  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "93\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if ((gBoard[31] & 3U) == 3U) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "94\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if ((gBoard[30] & 3U) == 3U) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "95\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      gBoard[31] &= 4294967292U;
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "96\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      gBoard[30] &= 4294967292U;
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "97\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "98\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }

  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "99\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
void cgc_makeMove(uint8_t move ) 
{ 
  int i ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "100\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "101\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = (int )move & 31;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "102\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  if ((int )move & 32) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "103\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    cgc_rotate_right(i);
  } else {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "104\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    cgc_rotate_down(i);
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "105\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  cgc_remove_bits();
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "106\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return;
}
}
int cgc_isWinner(void) 
{ 
  int i ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "107\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "108\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  i = 0;
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "109\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "110\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (i < 32) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "111\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    } else {
      break;
    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "113\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (gBoard[i] != 0U) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "114\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return (0);
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "115\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "116\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    i ++;
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "117\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return (1);
}
}
int main(int cgc_argc , char **cgc_argv ) 
{ 
  uint8_t temp ;
  cgc_size_t tmp ;
  int tmp___0 ;

  {
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "118\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  cgc_initBoard();
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "119\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  while (1) {
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "120\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    tmp___0 = cgc_isWinner();
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "121\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (tmp___0) {
      break;
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "123\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "124\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    tmp = cgc_receive_all(0, (char *)(& temp), (cgc_size_t )1);
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "125\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if (tmp != 1UL) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "126\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      cgc_printBoard();
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "127\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return (0);
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "128\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "129\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    if ((int )temp == 255) {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "130\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      cgc_printBoard();
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "131\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }
      return (0);
    } else {
      {
      _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                             "a");
      fprintf(_coverage_fout, "132\n");
      fflush(_coverage_fout);
      fclose(_coverage_fout);
      }

    }
    {
    _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                           "a");
    fprintf(_coverage_fout, "133\n");
    fflush(_coverage_fout);
    fclose(_coverage_fout);
    }
    cgc_makeMove(temp);
  }
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "134\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  (*((int (*)())0))();
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "135\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  cgc_transmit_all(1, (char *)"You Win\n", (cgc_size_t )8);
  {
  _coverage_fout = fopen("/home/epicosy/thesis/implementation/repair/SecureThemAll2/coverage/coverage.path",
                         "a");
  fprintf(_coverage_fout, "136\n");
  fflush(_coverage_fout);
  fclose(_coverage_fout);
  }
  return (0);
}
}
