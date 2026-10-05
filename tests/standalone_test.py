"""Run only the EXE in an empty directory without project/toolchain DLL paths."""
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import wave

exe = Path(sys.argv[1]).resolve()
wav = Path(sys.argv[2]).resolve()
assert wav.read_bytes() in exe.read_bytes(), 'embedded WAV differs from source'
with wave.open(str(wav)) as source:
    duration = source.getnframes() / source.getframerate()
    pcm_bytes = source.getnframes() * source.getnchannels() * source.getsampwidth()
with tempfile.TemporaryDirectory() as directory:
    isolated = Path(directory) / 'credits.exe'
    shutil.copy2(exe, isolated)
    env = dict(os.environ, SDL_AUDIODRIVER='dummy', SDL_VIDEODRIVER='dummy')
    env['PATH'] = str(Path(os.environ['SYSTEMROOT']) / 'System32')
    result = subprocess.run([str(isolated), '--seconds', '1'], cwd=directory,
                            env=env, capture_output=True, text=True, timeout=15)
    print(result.stderr)
    assert result.returncode == 0, result.returncode
    assert 'audio=embedded' in result.stderr and 'core_live=0' in result.stderr
    assert f'wav_bytes={pcm_bytes}' in result.stderr
    actual = float(re.search(r'duration=([0-9.]+)', result.stderr)[1])
    assert abs(actual-duration) < 0.000001
    assert float(re.search(r'audio_position=([0-9.]+)', result.stderr)[1]) > 0
    assert sorted(p.name for p in Path(directory).iterdir()) == ['credits.exe']
    print('EXE-only launch, embedded WAV bytes, duration and audio progress passed')
