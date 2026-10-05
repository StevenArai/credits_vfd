"""Independent pixel oracle from original Python's rendered ANSI cells."""
from pathlib import Path
import subprocess, sys, tempfile, struct, re, json
root = Path(__file__).resolve().parents[1]
patterns = {int(c):b for c,b in json.loads((root/'tools/font-editor-data.json').read_text(encoding='utf-8'))['glyphs'].items()}
with tempfile.TemporaryDirectory() as d:
    frames=Path(d)/'frames'; pixels=Path(d)/'pixels'
    subprocess.run([sys.executable,str(root/'tests/reference.py'),'--last','6508','--out',str(frames)],check=True,capture_output=True)
    data=frames.read_bytes(); size=4+1920*4
    codepoints=set()
    # Every frame audited for glyph coverage; scene boundaries and regular frames raster checked.
    for off in range(0,len(data),size):
        codepoints.update(c&65535 for c in struct.unpack_from('<1920I',data,off+4))
    selected=b''.join(data[i*size:(i+1)*size] for i in range(0,len(data)//size,19))
    # All glyphs, attrs and edges, including unsupported glyph and NBSP.
    cells=[(32+i%97) | (30+i%10)<<16 | (40+i%10)<<22 | (i%3)<<28 for i in range(1920)]
    cells[0]=160|39<<16|49<<22; cells[-1]=176|39<<16|49<<22
    selected+=struct.pack('<i1920I',-1,*cells); frames.write_bytes(selected)
    for uppercase in (False,True):
        subprocess.run([sys.argv[1],str(frames),str(pixels)]+(["uppercase"] if uppercase else []),check=True)
        output=pixels.read_bytes()
        for frame,off in enumerate(range(0,len(selected),size)):
            expected=bytearray(4096)
            for i,c in enumerate(struct.unpack_from('<1920I',selected,off+4)):
                ch=c&65535
                if uppercase and ord('a')<=ch<=ord('z'): ch-=32
                if ch==160: ch=32
                if ch not in patterns: ch=ord('?')
                for bit,stroke in enumerate(patterns[ch]):
                    on=((c>>16)&63)!=30 or c>>28==1 if stroke=='1' else ((c>>22)&63) not in (40,49)
                    if on:
                        x=8+i%80*3+bit%3; y=4+i//80*5+bit//3
                        expected[y*32+x//8]|=128>>(x%8)
            assert output[frame*4096:(frame+1)*4096]==expected,frame
    print('pixel frames',len(selected)//size,'missing', [f'U+{c:04X}' for c in sorted(codepoints) if not 32<=c<=126 and c!=160])
