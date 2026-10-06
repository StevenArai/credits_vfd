"""Compare current native output with a saved pre-change src directory."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from profile_core import ROOT, NATIVE

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--cc', required=True)
p.add_argument('--baseline-src', required=True)
p.add_argument('--out', default='build/float-weather')
a = p.parse_args()
out = (ROOT / a.out).resolve()
out.mkdir(parents=True, exist_ok=True)
executables = []
for kind, directory in [('before', Path(a.baseline_src).resolve()), ('after', ROOT/'src')]:
    exe = out / f'numeric-{kind}.exe'
    modules = [m if (directory/f'{m}.c').exists() else 'weather' if m == 'weather60' else m for m in NATIVE]
    subprocess.run([a.cc, '-std=c99', '-O3', '-ffp-contract=off', '-DCREDITS_DIRECT60=1', '-I', str(directory),
                    *[str(directory/f'{m}.c') for m in modules], str(ROOT/'tools/numeric_probe.c'), '-o', str(exe)], check=True)
    executables.append(exe)
reports = []
for seed in (0, 1, 42):
    for jump in range(1, 7):
        runs = [list(struct.iter_unpack('<6Q', subprocess.check_output([str(exe), str(seed), str(jump)]))) for exe in executables]
        assert len(runs[0]) == len(runs[1])
        counts = dict(rng=0, cells=0, pixels=0, weather=0)
        first = dict.fromkeys(counts)
        for before, after in zip(*runs):
            assert before[:2] == after[:2], ('timeline/typewriter changed', seed, jump, before[:2], after[:2])
            for index, name in enumerate(counts, 2):
                if before[index] != after[index]:
                    counts[name] += 1
                    if first[name] is None:
                        first[name] = before[0]
        reports.append(dict(seed=seed, jump=jump, frames=len(runs[0]), changed_frames=counts, first_changed_beat=first))
summary = dict(frames=sum(r['frames'] for r in reports), runs=reports,
               changed_frames={k:sum(r['changed_frames'][k] for r in reports) for k in counts})
(out/'comparison.json').write_text(json.dumps(summary, indent=2))
print(json.dumps({k:v for k,v in summary.items() if k != 'runs'}, indent=2))
