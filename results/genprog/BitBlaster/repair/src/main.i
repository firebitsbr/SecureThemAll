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
  rx_bytes = (cgc_size_t )0;
  total = (cgc_size_t )0;
  ret = 0;
  if ((unsigned long )buf == (unsigned long )((char *)0)) {
    return ((cgc_size_t )0);
  } else {

  }
  while (1) {
    ret = cgc_transmit(fd, (void const   *)buf, size - total, & rx_bytes);
    if (ret != 0) {
      return ((cgc_size_t )0);
    } else
    if (rx_bytes == 0UL) {
      return ((cgc_size_t )0);
    } else {

    }
    total += rx_bytes;
    if (total < size) {

    } else {
      break;
    }
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
  rx_bytes = (cgc_size_t )0;
  total = (cgc_size_t )0;
  ret = 0;
  if ((unsigned long )buf == (unsigned long )((char *)0)) {
    return ((cgc_size_t )0);
  } else {

  }
  while (1) {
    ret = cgc_receive(fd, (void *)buf, size - total, & rx_bytes);
    if (ret != 0) {
      return ((cgc_size_t )0);
    } else
    if (rx_bytes == 0UL) {
      return ((cgc_size_t )0);
    } else {

    }
    total += rx_bytes;
    if (total < size) {

    } else {
      break;
    }
  }
  return (size);
}
}
uint32_t gBoard[32]  ;
void cgc_rotate_right(int row ) 
{ 
  uint32_t temp ;

  {
  if (row < 0) {
    return;
  } else
  if (row >= 32) {
    return;
  } else {

  }
  temp = gBoard[row] >> 31;
  gBoard[row] = (gBoard[row] << 1) | temp;
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
  i = 0;
  temp = (uint32_t )0;
  if (col < 0) {
    return;
  } else
  if (col >= 32) {
    return;
  } else {

  }
  temp = gBoard[31];
  i = 31;
  while (i > 0) {
    gBoard[i] = (gBoard[i] & neg_mask[col]) | (gBoard[i - 1] & mask[col]);
    i --;
  }
  gBoard[0] = (gBoard[0] & neg_mask[col]) | (temp & mask[col]);
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
  i = 0;
  j = 0;
  k = 0;
  i = 0;
  while (i < 32) {
    j = 0;
    while (j < 32) {
      if (gBoard[i] & mask[j]) {
        tmp = k;
        k ++;
        buf[tmp] = (char )'1';
      } else {
        tmp___0 = k;
        k ++;
        buf[tmp___0] = (char )'.';
      }
      j ++;
    }
    tmp___1 = k;
    k ++;
    buf[tmp___1] = (char )'\n';
    i ++;
  }
  buf[k] = (char )'\000';
  cgc_transmit_all(1, buf, (cgc_size_t )k);
  return;
}
}
void cgc_initBoard(void) 
{ 


  {
  gBoard[31] = 4294967295U;
  gBoard[30] = 4294967295U;
  return;
}
}
void cgc_remove_bits(void) 
{ 


  {
  if ((gBoard[31] & 3U) == 3U) {
    if ((gBoard[30] & 3U) == 3U) {
      gBoard[31] &= 4294967292U;
      gBoard[30] &= 4294967292U;
    } else {

    }
  } else {

  }
  return;
}
}
void cgc_makeMove(uint8_t move ) 
{ 
  int i ;

  {
  i = 0;
  i = (int )move & 31;
  if ((int )move & 32) {
    cgc_rotate_right(i);
  } else {
    cgc_rotate_down(i);
  }
  cgc_remove_bits();
  return;
}
}
int cgc_isWinner(void) 
{ 
  int i ;

  {
  i = 0;
  i = 0;
  while (i < 32) {
    if (gBoard[i] != 0U) {
      return (0);
    } else {

    }
    i ++;
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
  cgc_initBoard();
  while (1) {
    tmp___0 = cgc_isWinner();
    if (tmp___0) {
      break;
    } else {

    }
    tmp = cgc_receive_all(0, (char *)(& temp), (cgc_size_t )1);
    if (tmp != 1UL) {
      cgc_printBoard();
      return (0);
    } else {

    }
    if ((int )temp == 255) {
      cgc_printBoard();
      return (0);
    } else {

    }
    cgc_makeMove(temp);
  }

  cgc_transmit_all(1, (char *)"You Win\n", (cgc_size_t )8);
  return (0);
}
}
