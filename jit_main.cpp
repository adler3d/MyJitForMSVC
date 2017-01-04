#define NOMENUS
#define NOHELP
#define NOPROFILER
#define NOKANJI
#define NOWH
#define NOSERVICE
#define NOMINMAX
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <memory>

#define QapNoWay()
typedef unsigned char uchar;
#define __i386__
#include "myjit/jitlib.h"
#include "myjit/jitlib-core.c"

int main()
{
  typedef long (*t_func)(int);

  auto*p=jit_init();
  jit_check_code(p,JIT_WARN_ALL);
  //jit_disable_optimization(p,JIT_OPT_ALL);
  t_func foo=nullptr;
  jit_prolog(p,&foo);

  jit_declare_arg(p,JIT_SIGNED_NUM,sizeof(int));
  jit_getarg(p,R(0),0);
  jit_addi(p,R(1),R(0),1);
  jit_retr(p,R(1));

  jit_generate_code(p);

  auto a=foo(1);
  auto b=foo(100);
  auto c=foo(255);

  jit_free(p);
  return 0;
}