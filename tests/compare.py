"""Run fresh Python and C processes; compare every rendered cell and final RNG/state."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
import sys
from reference import ROOT
FRAME=4+1920*4

def compare(expected,actual):
    with expected.open('rb') as left,actual.open('rb') as right:
        index=0
        while True:
            e=left.read(FRAME); a=right.read(FRAME)
            if e!=a:
                if len(e)!=len(a): raise AssertionError(f'frame count at {index}')
                beat=struct.unpack_from('<i',e)[0]
                if e[:4]!=a[:4]: raise AssertionError(f'beat differs at frame {index}')
                for cell in range(1920):
                    ec,ac=struct.unpack_from('<I',e,4+cell*4)[0],struct.unpack_from('<I',a,4+cell*4)[0]
                    if ec!=ac:
                        def describe(v): return {'char':chr(v&65535),'fg':v>>16&63,'bg':v>>22&63,'style':v>>28}
                        raise AssertionError(f'beat={beat} cell=({cell%80},{cell//80}) expected={describe(ec)} actual={describe(ac)}')
            if not e: break
            index+=1
    return index

def run(exe,seed,last,jump=1):
    folder=ROOT/f'build/test-artifacts/compare-{seed}-{jump}-{last}'; folder.mkdir(parents=True,exist_ok=True)
    py=folder/'python.bin'; c=folder/'c.bin'
    subprocess.run([sys.executable,ROOT/'tests/reference.py','--seed',str(seed),'--last',str(last),'--jump',str(jump),'--out',py],check=True,capture_output=True,text=True)
    cmd=[exe,'--seed',str(seed),'--last',str(last),'--replay',c,'--state',folder/'c.json','--trace',folder/'events.txt']
    if jump!=1: cmd+=['--jump',str(jump)]
    result=subprocess.run(cmd,capture_output=True,text=True)
    if result.returncode: raise RuntimeError(result.stderr)
    count=compare(py,c)
    expected=json.loads(py.with_suffix('.json').read_text()); actual=json.loads((folder/'c.json').read_text())
    for key in ('active','rng','ocean_time'): assert expected[key]==actual[key],f'final {key} differs: seed={seed}, jump={jump}'
    events=[list(map(int,line.split())) for line in (folder/'events.txt').read_text().splitlines()]
    assert events==expected['events'],'event order differs'
    print(f'seed={seed} jump={jump}: {count} frames / {count*1920} cells / {len(events)} events identical; final RNG and scene state identical')
    print(result.stderr.strip())

def main():
    p=argparse.ArgumentParser();p.add_argument('exe',type=Path);p.add_argument('--seeds',default='1');p.add_argument('--last',type=int,default=1079);p.add_argument('--jumps',default='1');args=p.parse_args()
    for seed in map(int,args.seeds.split(',')):
        for jump in map(int,args.jumps.split(',')): run(args.exe.resolve(),seed,args.last,jump)
if __name__=='__main__':main()
