"""Isolated host profiling: copy/instrument core, never change production sources.

Run with the project's LLVM-MinGW clang. Counters are not timing measurements.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
CORE = 'memory random canvas scheduler data credits ocean text scenes weather player framebuffer layout60'.split()
LIBCALLS = 'memcpy memmove memset strlen strcmp strchr memchr strncmp snprintf sscanf sin cos pow floor'.split()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--cc', required=True)
    parser.add_argument('--out', default='build/profile-core')
    args = parser.parse_args()
    out = (ROOT / args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    abi = {}
    for target, flags in [('host', []), ('arm', ['-target', 'arm-none-eabi', '-mcpu=cortex-m4'])]:
        ir = out / f'abi-{target}.ll'
        subprocess.run([args.cc, *flags, '-std=c99', '-I', str(ROOT / 'src'), '-S', '-emit-llvm',
                        str(ROOT / 'tools/profile_abi.c'), '-o', str(ir)], check=True)
        abi[target] = {k: int(v) for k, v in re.findall(r'@size_(\w+) = .*?constant i32 (\d+)', ir.read_text())}
    (out / 'abi.json').write_text(json.dumps(abi, indent=2))
    names = []
    sites = []
    scales = []
    for module in CORE:
        source = (ROOT / 'src' / f'{module}.c').read_text(encoding='utf-8')
        # Only top-level, single-line definitions; count logical calls even if inlined.
        def count(match):
            names.append(f'{module}:{match[1]}')
            return match[0] + f' profile_calls[{len(names)-1}]++;'
        source = re.sub(r'^\w[^\n;{}]*?\b(\w+)\([^\n;{}]*\)\s*\{', count, source, flags=re.M)
        if module != 'memory':
            lines = source.splitlines()
            for i, line in enumerate(lines):
                if 'mem_resize(' in line:
                    sites.append(f'{module}.c:{i+1}')
                    element = re.search(r'sizeof\((Section|WordLine|HistoryEntry)\)', line)
                    scales.append((abi['host'][element[1]], abi['arm'][element[1]]) if element else (1, 1))
                    line = line.replace('mem_resize(', f'profile_resize({len(sites)-1},')
                lines[i] = line.replace('mem_free(', 'profile_free(')
            source = '\n'.join(lines)
        # Insert after includes, so libc declarations are never macro-expanded.
        last_include = list(re.finditer(r'^#include[^\n]*\n', source, re.M))[-1].end()
        macros = ''.join(f'#define {name}(...) (profile_libcalls[{i}]++, {name}(__VA_ARGS__))\n'
                         for i, name in enumerate(LIBCALLS))
        source = source[:last_include] + macros + source[last_include:]
        (out / f'{module}.c').write_text('#include "profile.h"\n' + source, encoding='utf-8')
    header = '''#include "memory.h"
extern unsigned long long profile_calls[];
extern unsigned long long profile_libcalls[];
void *profile_resize(int site,Memory *m,void *p,size_t old,size_t size);
void profile_free(Memory *m,void *p,size_t size);
void profile_report(void);
extern int profile_beat;
'''
    (out / 'profile.h').write_text(header)
    support = (ROOT / 'tools/profile_support.c').read_text()
    support = support.replace('PROFILE_NAMES', ','.join(json.dumps(x) for x in names))
    support = support.replace('PROFILE_SITES', ','.join(json.dumps(x) for x in sites))
    support = support.replace('PROFILE_SCALES', ','.join('{%d,%d}' % pair for pair in scales))
    support = support.replace('PROFILE_LIBNAMES', ','.join(json.dumps(x) for x in LIBCALLS))
    (out / 'support.c').write_text(support)
    common = [args.cc, '-std=c99', '-O3', '-ffp-contract=off', '-I', str(ROOT / 'src'), '-I', str(out)]
    driver = ROOT / 'tools/profile_driver.c'
    for instrumented in (False, True):
        directory = out if instrumented else ROOT / 'src'
        exe = out / ('counts.exe' if instrumented else 'timing.exe')
        command = common + [str(directory / f'{x}.c') for x in CORE]
        command += [str(driver), str(ROOT / 'src/host_time.c')]
        if instrumented:
            command += ['-DPROFILE_COUNTS', str(out / 'support.c')]
        command += ['-o', str(exe)]
        subprocess.run(command, check=True)
        for seed in (0, 1, 42):
            result = subprocess.run([str(exe), str(seed)], check=True, capture_output=True, text=True)
            data = json.loads(result.stdout)
            (out / f'{exe.stem}-{seed}.json').write_text(json.dumps(data, indent=2))
    for seed in (0, 1, 42):
        counts = json.loads((out / f'counts-{seed}.json').read_text())
        timing = json.loads((out / f'timing-{seed}.json').read_text())
        assert counts['digest'] == timing['digest'], 'instrumentation changed output'
        assert counts['tracked_live_after_destroy'] == 0
        assert sum(x['calls'] for x in counts['sites']) == timing['allocations']
        assert sum(x['at_global_peak'] for x in counts['sites']) == timing['dynamic_peak']
    print(out)


if __name__ == '__main__':
    main()
