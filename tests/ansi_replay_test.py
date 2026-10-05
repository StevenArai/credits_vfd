import struct
import subprocess
import sys
from pathlib import Path
from reference import ROOT,Terminal
folder=ROOT/'build/ansi-replay';folder.mkdir(parents=True,exist_ok=True)
subprocess.run([Path(sys.argv[1]).resolve(),'--last','80','--replay',folder/'frames.bin','--ansi',folder/'frames.ansi'],check=True,capture_output=True)
frames=(folder/'frames.bin').read_bytes()
ansi=(folder/'frames.ansi').read_text(encoding='utf-8').split('\x1b[27;1H')
t=Terminal()
assert len(ansi)==82 and ansi[-1]==''
for i,output in enumerate(ansi[:-1]):
    t.feed(output)
    assert t.packed()==frames[i*7684+4:(i+1)*7684],f'ANSI emitted frame {i} differs'
assert any((cell&65535)!=32 for cell in t.cells[14*80:])
print('C terminal adapter: 81 complete emitted ANSI frames match core cells, including bottom 10 ocean rows')
