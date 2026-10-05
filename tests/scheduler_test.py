import contextlib
import io
import subprocess
import sys
from reference import ROOT
from animator import Scene, Generator, Event, SceneManager

def main():
    capture=io.StringIO()
    with contextlib.redirect_stdout(capture):
        scenes=[]
        for s in range(2):
            generators=[]
            for g in range(2):
                generators.append(Generator(2 if g else 0,
                    (lambda b: b%2==0) if g else Generator.always(),
                    lambda _,s=s,g=g: print('create',s,g),
                    lambda _,b,s=s,g=g: print('request',s,g,b),
                    lambda _,b,s=s,g=g: print('clear',s,g,b)))
            scenes.append(Scene(str(s),generators))
        events=[Event(b,lambda _,b=b: print('event',b)) for b in range(8)]
        events += [Event(0,Event.swap_scene('0')),Event(0,Event.layer_scene('1',2)),
                   Event(0,Event.swap_scene('0',1)),Event(2,Event.remove_scene('0')),Event(3,Event.layer_scene('0'))]
        manager=SceneManager(scenes,events)
        for i in range(8): manager.request_next(i not in (2,5))
        for scene in manager.active_scene: print('active',scene.name,scene.start_beat,scene.internal_beat)
    actual=subprocess.check_output([sys.argv[1]],text=True)
    assert actual==capture.getvalue(), (capture.getvalue(),actual)
    print(f'Scheduler: {len(actual.splitlines())} lifecycle/event records identical')

if __name__=='__main__': main()
