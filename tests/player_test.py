"""Execute the ORIGINAL menu and playback-loop AST with deterministic host adapters.
No rewritten Python animation or input logic is used as the oracle.
"""
import argparse
import ast
import contextlib
import io
from pathlib import Path
import struct
import subprocess
import sys
import types
from reference import ROOT,Terminal,load
from compare import compare

class Playback:
    def __init__(self): self.curr_pos=0.0;self.paused=False;self.active=True;self.last=0.0
    def seek(self,position): self.curr_pos=position
    def pause(self): self.paused=True
    def resume(self): self.paused=False
    def advance(self,now):
        if not self.paused:self.curr_pos+=now-self.last
        self.last=now

def replay(seed,jump,folder):
    scope=load(seed);terminal=Terminal();playback=Playback();clock=[0.0];pressed={str(jump)}
    scope.update(playback=playback,time=types.SimpleNamespace(time=lambda:clock[0],sleep=lambda _:None),
                 keyboard=types.SimpleNamespace(is_pressed=lambda key:key in pressed),time_menu=0.0)
    tree=ast.parse((ROOT/'credits.py').read_text(encoding='utf-8'))
    loops=[n for n in tree.body if isinstance(n,ast.While)]
    menu=next(n for n in loops if isinstance(n.test,ast.Compare))
    loop=next(n for n in loops if isinstance(n.test,ast.Attribute))
    exec(compile(ast.Module(body=[menu],type_ignores=[]),'credits.py','exec'),scope)
    playback.seek(scope['skip_by']);scope['last_update']=0.0;pressed.clear()
    body=compile(ast.Module(body=loop.body,type_ignores=[]),'credits.py','exec')
    tail=compile(ast.Module(body=tree.body[tree.body.index(loop)+1:],type_ignores=[]),'credits.py','exec')
    scope['os']=types.SimpleNamespace(name='nt',system=lambda _:print('\x1b[0m\x1b[2J\x1b[1;1H',end=''))
    samples=[];now=0.0
    # Include exact 30 Hz update boundary, duplicate time, paused backlog, and
    # simultaneous forward keys. Once latched, forward remains latched on release.
    for i in range(7600):
        now+= (0.0,1/30,0.000001,0.05,0.1,0.02)[i%6]
        keys=0
        if 140<=i<180 or 260<=i<275 or 310<=i<330 or 350<=i<375:keys|=1
        if 450<=i<455 or 600<=i<640:keys|=2
        if 470<=i<480 or 620<=i<645:keys|=4
        if 490<=i<500 or 635<=i<650:keys|=8
        samples.append((now,keys,1))
    # Stop after the original active flag becomes false, then another no-op poll.
    samples.extend([(now+0.02,0,0),(now+0.04,0,0)])
    (folder/'input.txt').write_text('\n'.join(f'{t:.17g} {k} {active}' for t,k,active in samples))
    with (folder/'python.bin').open('wb') as frames,(folder/'python.txt').open('w') as states:
        stopped=False
        for index,(now,keys,active) in enumerate(samples):
            clock[0]=now;pressed.clear()
            for bit,key in ((1,'p'),(2,','),(4,'.'),(8,'/')):
                if keys&bit:pressed.add(key)
            before=scope['beat'];result=0
            if not stopped:
                playback.advance(now);playback.active=bool(active)
                if playback.active:
                    capture=io.StringIO()
                    with contextlib.redirect_stdout(capture):exec(body,scope)
                    terminal.feed(capture.getvalue())
                    result=int(scope['beat']!=before)
                else:
                    # The external cls/clear adapter has an explicit default-attribute
                    # erase contract, shared with the C terminal adapter.
                    capture=io.StringIO()
                    with contextlib.redirect_stdout(capture):exec(tail,scope)
                    terminal.feed(capture.getvalue());result=2;stopped=True
            if result:frames.write(struct.pack('<i',index)+terminal.packed())
            values=(index,result,scope['beat'],scope['controller'].cur_beat,int(playback.paused),int(scope['paused_this_frame']),int(scope['ff_this_frame']))
            states.write(' '.join(map(str,values))+f' {playback.curr_pos.hex()} {scope["last_update"].hex()}\n')

def main():
    p=argparse.ArgumentParser();p.add_argument('exe',type=Path);p.add_argument('--seed',type=int,default=1);p.add_argument('--jump',type=int,default=1);args=p.parse_args()
    folder=ROOT/f'build/player-{args.seed}-{args.jump}';folder.mkdir(parents=True,exist_ok=True)
    replay(args.seed,args.jump,folder)
    subprocess.run([args.exe.resolve(),str(args.seed),str(args.jump),folder/'input.txt',folder/'c.bin',folder/'c.txt'],check=True)
    count=compare(folder/'python.bin',folder/'c.bin')
    expected=(folder/'python.txt').read_text().splitlines();actual=(folder/'c.txt').read_text().splitlines()
    assert len(expected)==len(actual)
    for e,a in zip(expected,actual):
        def parse(s):
            v=s.split();return [*map(int,v[:7]),*map(float.fromhex,v[7:])]
        assert parse(e)==parse(a),f'input state mismatch: expected={e}, actual={a}'
    print(f'player seed={args.seed} jump={args.jump}: {len(expected)} time/input states and {count} rendered/clear frames identical')
if __name__=='__main__':main()
