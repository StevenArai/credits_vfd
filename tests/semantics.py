import contextlib
import io
from pathlib import Path
import random
import struct
import subprocess
import sys
from reference import Terminal, ROOT
from CLIRender.classes import Canvas
from CLIRender.dat import Vector2


def main():
    exe = Path(sys.argv[1]).resolve()
    dest = ROOT/'build/test-artifacts/semantics'
    dest.mkdir(parents=True, exist_ok=True)
    for seed in (0, 1, 42, 0xffffffff, 0x123456789abcdef0):
        rng = random.Random(seed)
        lines = subprocess.check_output([exe, 'random', str(seed)], text=True).splitlines()
        for i, line in enumerate(lines):
            fields = line.split()
            actual = (float.fromhex(fields[0]), *(int(s) for s in fields[1:]))
            expected = (rng.random(), rng.randint(-100, 100), rng.randrange(65536), rng.choice(range(12)), rng.getrandbits(i % 65))
            assert actual == expected, (seed, i, expected, actual)
        assert len(lines) == 1000
    canvas, terminal = Canvas(Vector2(40, 24), 1, ()), Terminal()
    commands, frames = [], []

    def write(op, x, y, txt, col):
        fn = canvas.set_char if op == 'D' else canvas.set_string
        fn(0, Vector2(x,y), txt, col)
        commands.append(f'{op} {x} {y} {col.encode().hex() or "-"} {txt.encode().hex() or "-"}')

    def render():
        capture = io.StringIO()
        with contextlib.redirect_stdout(capture):
            canvas.render_all()
        terminal.feed(capture.getvalue())
        frames.append(terminal.packed())
        commands.append('R')

    render()
    for x,y,txt in ((0,0,'abc'), (39.5,0,'CROSS'), (0.25,2,'fraction'), (-0.25,3,'truncate'),
                    (-1,4,'previous line'), (0,23,'bottom'), (39.5,23,'edge'), (0,24,'hidden'),
                    (0,47,'backing bound'), (0,48,'clipped'), (-1,0,'negative'), (10,2,'°\u00a0')):
        write('S',x,y,txt,'\x1b[31m'); render()
    for col in ('\x1b[32m','', '\x1b[22m', '\x1b[1;34m', '\x1b[44m'):
        write('S',3,5,'abcdefghijklmnop',col)
        write('D',4,5,'##',col)
        write('D',4.5,5,'@@','\x1b[33m')
        write('S',2,5,'overlap','\x1b[1m')
        write('S',3,5,'',col)
        render()
    rng=random.Random(99)
    colours=('', '\x1b[1m\x1b[32m','\x1b[32m\x1b[1m','\x1b[22m\x1b[34m')
    for batch in range(150):
        for _ in range(rng.randint(1,90)):
            op=rng.choice(('S','D'))
            txt=rng.choice(('##','@@','  ')) if op=='D' else ''.join(rng.choice(' abcdef°\u00a0') for _ in range(rng.randrange(170)))
            write(op,rng.randrange(160)/2,rng.randrange(26),txt,rng.choice(colours))
        if batch%11==0:
            canvas.clear_layer(0); commands.append('C')
        render()
    path=dest/'canvas.txt'; path.write_text('\n'.join(commands),encoding='ascii')
    result=subprocess.run([exe,'canvas',path,dest/'actual.bin'],check=True,text=True,capture_output=True)
    actual=(dest/'actual.bin').read_bytes()
    expected=b''.join(frames)
    if actual!=expected:
        for i in range(0,min(len(actual),len(expected)),4):
            if actual[i:i+4]!=expected[i:i+4]:
                frame,cell=divmod(i//4,1920)
                raise AssertionError(f'canvas frame={frame} x={cell%80} y={cell//80} expected={expected[i:i+4].hex()} actual={actual[i:i+4].hex()}')
        raise AssertionError('frame count differs')
    subprocess.run([exe,'ansi',dest/'actual.bin',dest/'actual.ansi'],check=True)
    emitted=(dest/'actual.ansi').read_text(encoding='utf-8').split('\f')[:-1]
    check=Terminal()
    for i,ansi in enumerate(emitted):
        check.feed(ansi)
        assert check.packed()==frames[i],f'C ANSI roundtrip frame {i}'
    print(f'RNG: 5000 mixed API sequences identical; canvas: {len(frames)} ANSI frames and C ANSI roundtrips identical')
    print(result.stdout.strip())


if __name__=='__main__': main()
