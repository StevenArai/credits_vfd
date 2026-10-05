import contextlib
import io
import subprocess
import struct
import sys
from pathlib import Path
from reference import ROOT,Terminal,load
from compare import compare

def one(exe,name,at,frames):
    scope=load(42);controller=scope['controller'];controller.events={};canvas=scope['canvas'];terminal=Terminal()
    folder=ROOT/'build/scenes';folder.mkdir(parents=True,exist_ok=True)
    py=folder/f'{name}-{at}-python.bin';c=folder/f'{name}-{at}-c.bin'
    controller.start_scene(name,at)
    with py.open('wb') as output:
        for i in range(frames):
            if i:controller.request_next()
            capture=io.StringIO()
            with contextlib.redirect_stdout(capture):canvas.render_all()
            terminal.feed(capture.getvalue());output.write(struct.pack('<i',i)+terminal.packed())
    subprocess.run([exe,name,'42',str(at),str(frames),c],check=True)
    compare(py,c)

if __name__=='__main__':
    if len(sys.argv)>2:one(Path(sys.argv[1]).resolve(),sys.argv[2],int(sys.argv[3]),int(sys.argv[4]))
    else:
        import json
        scenes=json.loads((ROOT/'docs/reference-inventory.json').read_text())['scenes']
        for s in scenes:
            # Fresh processes retain import-time seeding and isolated weather/ocean.
            subprocess.run([sys.executable,__file__,sys.argv[1],s['name'],'0','24'],check=True)
        for name,at,length in [('title',64,8),('weather',1024,24),('loadingbar',240,8),('poweroff',0,24),('accesspoints',960,20)]:
            subprocess.run([sys.executable,__file__,sys.argv[1],name,str(at),str(length)],check=True)
        print('All 22 registered scenes plus five nonzero-start/condition boundaries match original ANSI frames')
