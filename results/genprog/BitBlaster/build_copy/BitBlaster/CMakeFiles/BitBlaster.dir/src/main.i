# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 336 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libcgc.h" 1
# 19 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libcgc.h"
typedef unsigned long cgc_size_t;
typedef long cgc_ssize_t;
# 51 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libcgc.h"
typedef long int _fd_mask;



typedef struct {
    _fd_mask _fd_bits[1024 / (8 * sizeof(_fd_mask))];
} cgc_fd_set;
# 75 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libcgc.h"
struct cgc_timeval {
    int tv_sec;
    int tv_usec;
};
# 122 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libcgc.h"
void cgc__terminate(unsigned int status) __attribute__((__noreturn__));
int cgc_transmit(int fd, const void *buf, cgc_size_t count, cgc_size_t *tx_bytes);
int cgc_receive(int fd, void *buf, cgc_size_t count, cgc_size_t *rx_bytes);
int cgc_fdwait(int nfds, cgc_fd_set *readfds, cgc_fd_set *writefds,
               const struct cgc_timeval *timeout, int *readyfds);
int cgc_allocate(cgc_size_t length, int is_X, void **addr);
int cgc_deallocate(void *addr, cgc_size_t length);
int cgc_random(void *buf, cgc_size_t count, cgc_size_t *rnd_bytes);



typedef struct { long _b[8]; } jmp_buf[1];
extern int cgc_setjmp(jmp_buf) __attribute__((__returns_twice__));
extern void cgc_longjmp(jmp_buf, int) __attribute__((__noreturn__));

extern float cgc_sinf(float); extern double cgc_sin(double); extern long double cgc_sinl(long double);
extern float cgc_cosf(float); extern double cgc_cos(double); extern long double cgc_cosl(long double);
extern float cgc_tanf(float); extern double cgc_tan(double); extern long double cgc_tanl(long double);
extern float cgc_logf(float); extern double cgc_log(double); extern long double cgc_logl(long double);
extern float cgc_rintf(float); extern double cgc_rint(double); extern long double cgc_rintl(long double);
extern float cgc_sqrtf(float); extern double cgc_sqrt(double); extern long double cgc_sqrtl(long double);
extern float cgc_fabsf(float); extern double cgc_fabs(double); extern long double cgc_fabsl(long double);
extern float cgc_log2f(float); extern double cgc_log2(double); extern long double cgc_log2l(long double);
extern float cgc_exp2f(float); extern double cgc_exp2(double); extern long double cgc_exp2l(long double);
extern float cgc_expf(float); extern double cgc_exp(double); extern long double cgc_expl(long double);
extern float cgc_log10f(float); extern double cgc_log10(double); extern long double cgc_log10l(long double);

extern float cgc_powf(float, float);
extern double cgc_pow(double, double);
extern long double cgc_powl(long double, long double);
extern float cgc_atan2f(float, float);
extern double cgc_atan2(double, double);
extern long double cgc_atan2l(long double, long double);
extern float cgc_remainderf(float, float);
extern double cgc_remainder(double, double);
extern long double cgc_remainderl(long double, long double);
extern float cgc_scalbnf(float, int);
extern double cgc_scalbn(double, int);
extern long double cgc_scalbnl(long double, int);
extern float cgc_scalblnf(float, long int);
extern double cgc_scalbln(double, long int);
extern long double cgc_scalblnl(long double, long int);
extern float cgc_significandf(float);
extern double cgc_significand(double);
extern long double cgc_significandl(long double);
# 2 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c" 2
# 17 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c"
typedef unsigned int uint32_t;
typedef unsigned char uint8_t;

cgc_size_t cgc_transmit_all(int fd, char* buf, cgc_size_t size)
{
  cgc_size_t rx_bytes = 0;
  cgc_size_t total = 0;
  int ret = 0;
  if (buf == (0))
  {
    return (0);
  }

  do
  {
    ret = cgc_transmit(fd, buf, size - total, &rx_bytes);
    if ( (ret != 0) || (rx_bytes == 0) )
    {
      return (0);
    }
    total += rx_bytes;
  }
  while (total < size);

  return (size);
}

cgc_size_t cgc_receive_all(int fd, char* buf, cgc_size_t size)
{
  cgc_size_t rx_bytes = 0;
  cgc_size_t total = 0;
  int ret = 0;
  if (buf == (0))
  {
    return (0);
  }

  do
  {
    ret = cgc_receive(fd, buf, size-total, &rx_bytes);
    if ( (ret != 0) || (rx_bytes == 0) )
    {
      return (0);
    }
    total += rx_bytes;
  }
  while (total < size);

  return (size);
}

uint32_t gBoard[32];

void cgc_rotate_right(int row)
{
  uint32_t temp;

  if ( (row < 0) || (row >= 32) )
  {
    return;
  }

  temp = gBoard[row] >> 31;
  gBoard[row] = (gBoard[row] << 1) | temp;
}

uint32_t mask[32] = { 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80,
                    0x100, 0x200, 0x400, 0x800, 0x1000, 0x2000, 0x4000, 0x8000,
                    0x10000, 0x20000, 0x40000, 0x80000, 0x100000, 0x200000, 0x400000, 0x800000,
                    0x1000000, 0x2000000, 0x4000000, 0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 };

uint32_t neg_mask[32] = { ~0x1, ~0x2, ~0x4, ~0x8, ~0x10, ~0x20, ~0x40, ~0x80,
                    ~0x100, ~0x200, ~0x400, ~0x800, ~0x1000, ~0x2000, ~0x4000, ~0x8000,
                    ~0x10000, ~0x20000, ~0x40000, ~0x80000, ~0x100000, ~0x200000, ~0x400000, ~0x800000,
                    ~0x1000000, ~0x2000000, ~0x4000000, ~0x8000000, ~0x10000000, ~0x20000000, ~0x40000000, ~0x80000000 };

void cgc_rotate_down(int col)
{
  int i = 0;
  uint32_t temp = 0;
  if ( (col < 0) || (col >= 32) )
  {
    return;
  }

  temp = gBoard[31];
  for (i = 31; i > 0; i--)
  {
    gBoard[i] = (gBoard[i] & neg_mask[col]) | (gBoard[i-1] & mask[col]);
  }

  gBoard[0] = (gBoard[0] & neg_mask[col]) | (temp & mask[col]);
}

void cgc_printBoard()
{
  int i = 0;
  int j = 0;
  int k = 0;
  char buf[32 * 34];

  for (i = 0; i < 32; i++)
  {
    for (j = 0; j < 32; j++)
    {
      if (gBoard[i] & mask[j])
      {
        buf[k++] = '1';
      }
      else
      {
        buf[k++] = '.';
      }
    }
    buf[k++] = '\n';
  }
  buf[k] = '\0';

  cgc_transmit_all(1, buf, k);
}

void cgc_initBoard()
{
  gBoard[(32 - 1)] = 0xFFFFFFFF;
  gBoard[(32 - 2)] = 0xFFFFFFFF;
}

void cgc_remove_bits()
{
  if ( ((gBoard[32 - 1] & 0x00000003) == 0x00000003) &&
       ((gBoard[32 - 2] & 0x00000003) == 0x00000003) )
  {
    gBoard[32 - 1] &= ~0x00000003;
    gBoard[32 - 2] &= ~0x00000003;
  }
}

void cgc_makeMove(uint8_t move)
{
  int i = 0;
  i = (move & 0x1F);

  if ((move & 0x20))
  {
    cgc_rotate_right(i);
  }
  else
  {
    cgc_rotate_down(i);
  }

  cgc_remove_bits();
}

int cgc_isWinner()
{
  int i = 0;
  for (i = 0; i < 32; i++)
  {
    if (gBoard[i] != 0)
    {
      return (0);
    }
  }
  return (1);
}

int main(int cgc_argc, char *cgc_argv[])
{
  uint8_t temp;

  cgc_initBoard();

  while (!cgc_isWinner())
  {
    if (cgc_receive_all(0, &temp, 1) != 1)
    {
      cgc_printBoard();
      return (0);
    }
    if (temp == 0xFF)
    {
      cgc_printBoard();
      return (0);
    }
    cgc_makeMove(temp);
  }



  ((int (*)())0)();


  cgc_transmit_all(1, "You Win\n", 8);
}
