"""Native dimensions/RNG, original Python transient corruption function unchanged."""
import ast
import math
from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parents[1]
source = ast.parse((root / 'archive/python/ocean.py').read_text(encoding='utf-8'))
function = next(n for n in source.body if isinstance(n, ast.FunctionDef) and n.name == 'mutate_text')

class Noise:
    def __init__(self, state):
        self.state = state
    def random(self):
        n = self.state
        n ^= (n << 13) & 0xffffffff
        n ^= n >> 17
        n ^= (n << 5) & 0xffffffff
        self.state = n
        return n / 4294967296

for seed in (0, 1, 42):
    lines = subprocess.check_output([sys.argv[1], str(seed)], text=True).splitlines()
    phase, state, _, base, _ = lines[0].split()
    phase, state = int(phase), int(state)
    base = bytes.fromhex(base).decode('latin1')
    rng = Noise(state)
    scope = dict(random=rng, math=math, alphabet='abcdefghijklmnopqrstuvwxyz')
    exec(compile(ast.Module(body=[function], type_ignores=[]), 'original ocean.py mutate_text', 'exec'), scope)
    flashes = 0
    partial_500 = 0
    for line in lines[1:]:
        actual_phase, actual_state, glitch, actual_base, actual_output = line.split()
        glitch = int(glitch)
        x = phase / 5
        wave = math.cos(.2*x) + math.sin(.3*x)*math.sin(.23*x)
        height = max(0, min(7, math.floor((3-2*wave*math.sin(x))*7/9+.5)))
        column = []
        # Original get_ocean_slice probability/order, eight native rows.
        for y in range(8):
            if rng.random() <= .002 * glitch:
                column.append(chr(97 + math.floor(rng.random()*26)))
            else:
                column.append('#' if y == height else '.' if y > height else chr(160))
        base = ''.join(base[y*60+1:(y+1)*60] + column[y] for y in range(8))
        phase += 1
        scope['ocean_time'] = phase
        output = scope['mutate_text'](base, glitch)
        assert base == bytes.fromhex(actual_base).decode('latin1'), (seed, phase, 'persistent')
        assert output == bytes.fromhex(actual_output).decode('latin1'), (seed, phase, 'Python rendered output')
        assert (phase, rng.state) == (int(actual_phase), int(actual_state)), (seed, phase, 'RNG')
        flashes += sum(a != b for a, b in zip(base, output))
        if glitch == 500 and any(c in '#.\xa0' for c in output):
            partial_500 += 1
    assert flashes > 1000 and partial_500 > 0
    print(f'seed {seed}: 840 rendered frames match original mutate_text; {flashes} transient cells; {partial_500} non-saturated frames at glitch=500')
