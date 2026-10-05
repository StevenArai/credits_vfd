"""After profile_core.py --native, audit math calls/polling; no production changes."""
import argparse
import json
from pathlib import Path
import subprocess
from profile_core import NATIVE, ROOT

p = argparse.ArgumentParser()
p.add_argument('--cc', required=True)
p.add_argument('--out', default='build/profile-hotspots')
a = p.parse_args()
out = (ROOT / a.out).resolve()
out.mkdir(parents=True, exist_ok=True)
common = [a.cc, '-std=c99', '-O3', '-ffp-contract=off', '-DCREDITS_DIRECT60=1', '-I', str(ROOT/'src'), '-I', str(out)]
sources = [str(ROOT/'src'/f'{m}.c') for m in NATIVE]
for module in ('scenes60', 'weather', 'player_fixed', 'ocean60', 'framebuffer'):
    subprocess.run(common + ['-S', '-emit-llvm', str(ROOT/'src'/f'{module}.c'), '-o', str(out/f'{module}.ll')], check=True)

# Link-time wrappers count calls AFTER compiler optimization, not source macros.
math = ['pow', 'sin', 'cos', 'floor']
wrapper = '#include <stdio.h>\nint profile_beat=-1;\n'
wrapper += 'static unsigned long long totals[4], peaks[4], current[4];\nstatic int last[4]={-2,-2,-2,-2}, at[4];\n'
for i, name in enumerate(math):
    args = 'double x,double y' if name == 'pow' else 'double x'
    call = 'x,y' if name == 'pow' else 'x'
    wrapper += f'double __real_{name}({args});\ndouble __wrap_{name}({args}) {{ totals[{i}]++; if(last[{i}]!=profile_beat) {{current[{i}]=0; last[{i}]=profile_beat;}} if(++current[{i}]>peaks[{i}]) {{peaks[{i}]=current[{i}];at[{i}]=profile_beat;}} return __real_{name}({call}); }}\n'
wrapper += 'void profile_report(void) {\n'
for i, name in enumerate(math):
    wrapper += f'printf(",\\\"machine_{name}\\\":%llu,\\\"peak_{name}\\\":%llu,\\\"peak_frame_{name}\\\":%d",totals[{i}],peaks[{i}],at[{i}]);\n'
wrapper += '}\n'
(out/'math_wrap.c').write_text(wrapper)
exe = out/'math_calls.exe'
subprocess.run(common + ['-DPROFILE_COUNTS'] + sources + [str(ROOT/'tools/profile_driver.c'), str(ROOT/'src/host_time.c'), str(out/'math_wrap.c'), '-Wl,'+','.join('--wrap='+n for n in math), '-o', str(exe)], check=True)
results = []
for seed in (0,1,42):
    result = json.loads(subprocess.check_output([str(exe), str(seed)], text=True))
    baseline = json.loads((out/f'timing-{seed}.json').read_text())
    assert result['digest'] == baseline['digest']
    results.append(result)
(out/'math-calls.json').write_text(json.dumps(results, indent=2))

exe = out/'player_poll.exe'
subprocess.run(common + sources + [str(ROOT/'tools/profile_player.c'), str(ROOT/'src/host_time.c'), '-o', str(exe)], check=True)
results = [json.loads(subprocess.check_output([str(exe), str(hz)], text=True)) for hz in (100,1000) for repeat in range(5)]
assert len({r['canvas_hash'] for r in results}) == 1
(out/'player-poll.json').write_text(json.dumps(results, indent=2))
# Compile the actual fixed player for M0 soft ABI; no SDK/link/runtime implied.
subprocess.run([a.cc, '-target', 'arm-none-eabi', '-mcpu=cortex-m0', '-mfloat-abi=soft',
                '-DCREDITS_DIRECT60=1', '-I', str(ROOT/'src'), '-O3', '-S',
                str(ROOT/'src/player_fixed.c'), '-o', str(out/'arm_player_fixed.s')], check=True)
print(out)
