"""Exercise real SDL queue API deterministically with a generated PCM fixture."""
import os, re, struct, subprocess, sys, tempfile, wave
from pathlib import Path
with tempfile.TemporaryDirectory() as d:
    wav=Path(d)/'tone.wav'; bmp=Path(d)/'display.bmp'
    with wave.open(str(wav),'wb') as out:
        out.setparams((1,2,44100,0,'NONE','not compressed'))
        out.writeframes(b''.join(struct.pack('<h',1000 if i%100<50 else -1000) for i in range(44100*7)))
    env=dict(os.environ,SDL_AUDIODRIVER='dummy',SDL_VIDEODRIVER='dummy')
    run=subprocess.run([sys.argv[1],'--audio',str(wav),'--scripted','--seconds','10','--snapshot',str(bmp)],env=env,capture_output=True,text=True,timeout=15)
    print(run.stderr)
    assert run.returncode==0
    assert 'exit_reason=audio-eof' in run.stderr
    assert 'script_stage=2' in run.stderr and 'core_live=0' in run.stderr
    assert 'display_readback=matched 864x480' in run.stderr
    assert 'audio_position=7.000000' in run.stderr, 'must stop at exact sample EOF'
    assert float(re.search(r'max_backlog_ms=([0-9.]+)',run.stderr)[1])<0.001
    print('SDL queue pause/resume/seek/EOF and RGB readback passed')
