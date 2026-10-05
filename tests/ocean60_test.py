"""Independent 10-to-8 reduction oracle; preserve source '#' after glitches."""
from pathlib import Path
import struct
import subprocess
import sys
import tempfile

groups = [(0,), (1,), (2,), (3,), (4, 5), (6,), (7,), (8, 9)]
frames = rescued = 0
with tempfile.TemporaryDirectory() as folder:
    for seed in (0, 1, 42):
        paths = [Path(folder) / name for name in ('native.bin', 'reference.bin')]
        for exe, path in zip(sys.argv[1:3], paths):
            subprocess.run([exe, str(seed), str(path)], check=True)
        native, reference = [p.read_bytes() for p in paths]
        assert len(native) == 330 * (8 + 480 * 4)
        assert len(reference) == 330 * (8 + 800 * 4)
        for frame in range(330):
            n = frame * (8 + 480 * 4)
            r = frame * (8 + 800 * 4)
            assert native[n:n+8] == reference[r:r+8], ('RNG', seed, frame)
            source = struct.unpack_from('<800I', reference, r+8)
            actual = struct.unpack_from('<480I', native, n+8)
            expected = []
            for rows in groups:
                for x in range(60):
                    candidates = [source[y*80+x*79//59] for y in rows]
                    coast = next((c for c in candidates if c & 65535 == ord('#')), None)
                    expected.append(coast if coast is not None else candidates[-1])
                    rescued += coast is not None and candidates[-1] & 65535 != ord('#')
            assert tuple(expected) == actual, ('reduction', seed, frame)
            if frame < 10:
                row = next(i for i, rows in enumerate(groups) if frame in rows)
                for x in range(59):
                    assert actual[row*60+x] & 65535 == ord('#'), ('shoreline hole', seed, frame, x)
            frames += 1
assert rescued > 0
print(f'{frames} ocean frames, all ten shoreline heights and five glitch levels; {rescued} dropped shoreline cells preserved; RNG identical')
