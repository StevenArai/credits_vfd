"""Audit compiled native arithmetic, with declaration-only libc stubs for ARM.

The ARM object is not linked firmware; libc implementations and board timing are
outside this audit. Uses the actual distributed implementation, not a math model.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
from profile_core import ROOT

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--cc', required=True)
p.add_argument('--out', default='build/float-weather/audit')
a = p.parse_args()
out = (ROOT/a.out).resolve()
stubs = out/'libc-declarations'
stubs.mkdir(parents=True, exist_ok=True)
headers = {
    'stdio.h': '#include <stddef.h>\ntypedef struct RamAuditFile FILE;\nextern FILE *stderr;\nint fprintf(FILE *,const char *,...);\nint snprintf(char *,size_t,const char *,...);\nint sscanf(const char *,const char *,...);\n',
    'stdlib.h': 'void abort(void) __attribute__((noreturn));\n',
    'string.h': '#include <stddef.h>\nvoid *memcpy(void *,const void *,size_t);\nvoid *memmove(void *,const void *,size_t);\nvoid *memset(void *,int,size_t);\nsize_t strlen(const char *);\nchar *strcpy(char *,const char *);\nchar *strchr(const char *,int);\nvoid *memchr(const void *,int,size_t);\nint strcmp(const char *,const char *);\nint strncmp(const char *,const char *,size_t);\n',
    'math.h': '/* Native code needs no libm declarations. */\n',
}
for name, text in headers.items():
    guard='RAM_AUDIT_'+name.replace('.', '_').upper()
    (stubs/name).write_text(f'#ifndef {guard}\n#define {guard}\n'+text+'#endif\n')
source = ROOT/'tests/animator_single_impl.c'
common = ['-std=c99', '-O3', '-ffp-contract=off', '-Wdouble-promotion', '-Werror=double-promotion', '-I', str(ROOT/'include')]
arm = ['-target', 'arm-none-eabi', '-mcpu=cortex-m4', '-mfpu=fpv4-sp-d16', '-mfloat-abi=hard', '-I', str(stubs)]
subprocess.run([a.cc, *common, *arm, '-S', '-emit-llvm', str(source), '-o', str(out/'cortex-m4.ll')], check=True)
subprocess.run([a.cc, *common, *arm, '-S', '-fstack-usage', str(source), '-o', str(out/'cortex-m4.s')], check=True)
subprocess.run([a.cc, *common, '-S', '-emit-llvm', str(source), '-o', str(out/'host.ll')], check=True)
ir = (out/'cortex-m4.ll').read_text()
asm = (out/'cortex-m4.s').read_text()
assert not re.search(r'\bdouble\b', ir), 'double remains in native IR'
assert not re.search(r'__aeabi_d\w+', asm), 'soft double helper remains'
assert not re.search(r'\bdeclare\b[^\n]*@(?:sin|sinf|cos|cosf|pow|powf|floor|floorf)\(', ir), 'libm import remains'
report = dict(target='cortex-m4 / fpv4-sp-d16 / hard ABI', linked_firmware=False,
              double_ir_types=0, soft_double_helpers=0,
              float_instructions=len(re.findall(r'\bv\w+\.f32\b', asm)),
              declarations=re.findall(r'^declare[^@]*@([^ (]+)', ir, re.M))
(out/'report.json').write_text(json.dumps(report, indent=2))
print(json.dumps(report, indent=2))
