import json
from pathlib import Path
import random
import struct
import subprocess
import sys
from reference import ROOT,load

def main():
    exe=Path(sys.argv[1]).resolve();seed=int(sys.argv[2]) if len(sys.argv)>2 else 1
    scope=load(seed)
    folder=ROOT/'build/test-artifacts/data';folder.mkdir(parents=True,exist_ok=True)
    path=folder/f'{seed}.bin';state=folder/f'{seed}.json'
    subprocess.run([exe,'--seed',str(seed),'--last','-1','--dump-data',path,'--state',state],check=True,capture_output=True)
    data=path.read_bytes(); ocean_time=struct.unpack_from('<i',data)[0];offset=4
    import ocean
    assert ocean_time==ocean.ocean_time
    for name,expected in scope['data_strings'].items():
        length,lines,repeat=struct.unpack_from('<iii',data,offset);offset+=12
        raw=data[offset:offset+length+1];offset+=length+1
        assert raw[-1:]==b'\0'
        if isinstance(expected,str): actual=raw[:-1].decode()
        else:
            parts=raw[:-1].decode().split('\0')
            assert len(parts)==lines
            actual=[line.split('#') for line in parts]*repeat
        assert actual==expected,f'{name} differs'
    assert offset==len(data)
    actual=json.loads(state.read_text())
    assert actual['rng']==list(random.getstate()[1]),'import-time RNG differs'
    print(f'seed={seed}: all 18 initialized texts, empty tokens/repetition and import-time RNG state identical')
if __name__=='__main__':main()
