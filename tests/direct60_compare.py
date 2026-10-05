"""Native/reference business replay and explicitly scoped visual comparisons."""
import json
from pathlib import Path
import subprocess
import sys

def run(exe, seed, jump):
    result = subprocess.run([exe, str(seed), str(jump)], capture_output=True, text=True, check=True)
    assert 'live=0' in result.stderr
    return [line.split() for line in result.stdout.splitlines()], result.stderr.strip()

def main():
    native, reference = sys.argv[1:3]
    total = matched = title = ocean = ocean_changed = blocks = 0
    reports = []
    for seed in (0, 1, 42):
        for jump in range(1, 7):
            a, resources = run(native, seed, jump)
            b, _ = run(reference, seed, jump)
            assert len(a) == len(b)
            assert 'clipped=0' in resources, resources
            equal = 0
            for x, y in zip(a, b):
                beat = int(x[0])
                assert x[:2] == y[:2], ('business state', seed, jump, beat, x[:2], y[:2])
                equal += x[6] == y[6]
                # Layout may change, but these established regions must not.
                if 1080 <= beat <= 1843 and jump <= 2:
                    assert x[6] == y[6], ('title pixels', seed, jump, beat)
                    title += 1
                if 60 <= beat <= 1078 or 3376 <= beat <= 3379 or 3896 <= beat <= 4459:
                    # Contour-preserving reduction intentionally differs from the
                    # old row-dropping layout. ocean60_test checks its full oracle.
                    ocean_changed += x[3] != y[3]
                    ocean += 1
                if 1080 <= beat <= 1843:
                    assert x[5] == y[5], ('title block', seed, jump, beat)
                    blocks += 1
            total += len(a); matched += equal
            reports.append(dict(seed=seed, jump=jump, frames=len(a), exact_pixel_frames=equal, resources=resources))
    report = dict(frames=total, exact_pixel_frames=matched, changed_pixel_frames=total-matched,
                  title_pixel_frames=title, ocean_cell_frames=ocean, ocean_changed_frames=ocean_changed,
                  block_cell_frames=blocks, runs=reports)
    folder = Path(__file__).resolve().parents[1] / 'build/test-artifacts'
    folder.mkdir(parents=True, exist_ok=True)
    (folder / 'direct60-comparison.json').write_text(json.dumps(report, indent=2))
    print(json.dumps({k:v for k,v in report.items() if k != 'runs'}))
    print('All business hashes match; changed layouts are reported, not called identical.')

if __name__ == '__main__':
    main()
