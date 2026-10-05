"""Independent adapter: original modules, import-time seed, actual render_all ANSI.

CPython is pinned because Random and float/string semantics are part of the oracle.
The 80-column terminal has >= 28 rows, so render_all's row-27 footer cannot scroll
the visible 24 rows. LF has the normal host text-mode CRLF behavior.
"""
import argparse
import ast
import contextlib
import hashlib
import io
import json
from pathlib import Path
import random
import re
import struct
import sys
sys.dont_write_bytecode = True
import types

ROOT = Path(__file__).resolve().parents[1]
REFERENCE_ROOT = ROOT / 'archive' / 'python'
sys.path.insert(0, str(REFERENCE_ROOT))
VERSION = (3, 13, 11)


class Terminal:
    def __init__(self):
        self.cells = [32 | 39 << 16 | 49 << 22] * 1920
        self.row = self.col = 0
        self.fg, self.bg, self.style = 39, 49, 0

    def feed(self, ansi):
        i = 0
        while i < len(ansi):
            if ansi[i] == '\x1b':
                match = re.match(r'\x1b\[([0-9;]*)([A-Za-z])', ansi[i:])
                if not match:
                    raise ValueError(repr(ansi[i:i+30]))
                args = [int(n or 0) for n in match[1].split(';')]
                if match[2] == 'H':
                    self.row = max(1, args[0]) - 1
                    self.col = max(1, args[1] if len(args) > 1 else 1) - 1
                elif match[2] == 'm':
                    for code in args:
                        if code == 0:
                            self.fg, self.bg, self.style = 39, 49, 0
                        elif code in (1, 2, 22):
                            self.style = 0 if code == 22 else code
                        elif 30 <= code <= 39:
                            self.fg = code
                        elif 40 <= code <= 49:
                            self.bg = code
                        else:
                            raise ValueError(code)
                elif match[2] == 'J' and args == [2]:
                    self.cells = [32 | self.fg << 16 | self.bg << 22 | self.style << 28] * 1920
                else:
                    raise ValueError(match[0])
                i += len(match[0])
                continue
            ch = ansi[i]
            if ch == '\n':
                self.row += 1
                self.col = 0
            elif ch == '\r':
                self.col = 0
            else:
                if self.col >= 80:
                    self.row += 1
                    self.col = 0
                if 0 <= self.row < 24:
                    self.cells[self.row * 80 + self.col] = ord(ch) | self.fg << 16 | self.bg << 22 | self.style << 28
                self.col += 1
            i += 1

    def packed(self):
        return struct.pack('<1920I', *self.cells)


def load(seed):
    if sys.version_info[:3] != VERSION:
        raise RuntimeError(f'Reference requires CPython {VERSION}, got {sys.version}')
    random.seed(seed)  # before ocean and string_defs imports, including corrupt templates
    sys.modules['keyboard'] = types.SimpleNamespace(is_pressed=lambda key: False)
    sys.modules['just_playback'] = types.SimpleNamespace(Playback=object)
    import CLIRender.classes
    CLIRender.classes.enable_ansi = lambda: None
    source = ast.parse((REFERENCE_ROOT / 'credits.py').read_text(encoding='utf-8'))
    body = []
    for node in source.body:
        if isinstance(node, ast.Assign) and any(isinstance(t, ast.Name) and t.id == 'playback' for t in node.targets):
            break
        body.append(node)
    scope = {'__name__': 'reference_credits'}
    exec(compile(ast.Module(body=body, type_ignores=[]), 'credits.py', 'exec'), scope)
    return scope


def inventory(scope):
    import animation_scenes
    scenes = scope['all_scenes']
    events = scope['controller'].events
    strings = scope['data_strings']
    source = ast.parse((REFERENCE_ROOT / 'credits.py').read_text(encoding='utf-8'))
    return {
        'python': sys.version, 'baseline': '18f5cf36a10a7e95aa20d4bf31fd79a5895ccdb0',
        'scenes': [{'name': s.name, 'generators': len(s.generators),
                    'starts': [g.start_beat for g in s.generators]} for s in scenes],
        'defined_but_excluded': [s.name for s in vars(animation_scenes).values()
                                if isinstance(s, scope['am'].Scene) and s not in scenes],
        'events': [{'beat': b, 'actions': [ast.get_source_segment((REFERENCE_ROOT/'credits.py').read_text(encoding='utf-8'),
                    next(n for n in ast.walk(source) if isinstance(n, ast.Lambda) and n.lineno == e.do.__code__.co_firstlineno))
                    if e.do.__code__.co_filename == 'credits.py' else list(e.do.__closure__[i].cell_contents for i in range(len(e.do.__closure__ or ())))
                    for e in ev]} for b, ev in events.items()],
        'strings': {k: {'kind': 'string' if isinstance(v, str) else 'words', 'characters': len(v) if isinstance(v, str) else sum(len(w) for line in v for w in line),
                         'lines': len(v.split('\n')) if isinstance(v, str) else len(v),
                         'words': None if isinstance(v, str) else sum(len(line) for line in v)} for k, v in strings.items()},
        'random_calls': {name: [{'line': n.lineno, 'call': ast.unparse(n)} for n in ast.walk(ast.parse((REFERENCE_ROOT/name).read_text(encoding='utf-8')))
                               if isinstance(n, ast.Call) and isinstance(n.func, ast.Attribute) and isinstance(n.func.value, ast.Name) and n.func.value.id == 'random']
                         for name in ('ocean.py', 'animation_functions.py', 'animation_classes.py', 'animation_scenes.py', 'credits.py')}
    }


def replay(scope, out, last, jump=1):
    controller, canvas = scope['controller'], scope['canvas']
    jumps = (0, 1000, 1770, 3040, 3780, 5420)
    controller.cur_beat += jumps[jump-1]
    if jump == 3:
        am = scope['am']
        controller.events[1849] = (am.Event(1849, am.Event.layer_scene('redraw_ui')),)
        controller.events[1860] = (am.Event(1860, am.Event.remove_scene('redraw_ui')),)
    terminal = Terminal()
    digest = hashlib.sha256()
    event_trace = []
    for b, events in controller.events.items():
        for index, event in enumerate(events):
            original = event.do
            def traced(c, fn=original, beat=b, ix=index):
                event_trace.append([beat, ix])
                fn(c)
            event.do = traced
    count = 0
    with out.open('wb') as frames:
        while controller.cur_beat < last:
            controller.request_next()
            capture = io.StringIO()
            with contextlib.redirect_stdout(capture):
                canvas.render_all()
            terminal.feed(capture.getvalue())
            record = struct.pack('<i', controller.cur_beat) + terminal.packed()
            digest.update(record)
            frames.write(record)
            count += 1
    import ocean
    return {'frames': count, 'sha256': digest.hexdigest(), 'events': event_trace,
            'active': [[s.name, s.start_beat, s.internal_beat] for s in controller.active_scene],
            'rng_state_sha256': hashlib.sha256(repr(random.getstate()).encode()).hexdigest(),
            'rng': list(random.getstate()[1]), 'ocean_time': ocean.ocean_time}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--seed', type=int, default=1)
    parser.add_argument('--last', type=int, default=6508)
    parser.add_argument('--jump', type=int, default=1, choices=range(1, 7))
    parser.add_argument('--out', type=Path, default=ROOT/'build/test-artifacts/reference.bin')
    args = parser.parse_args()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    scope = load(args.seed)
    (args.out.parent/'inventory.json').write_text(json.dumps(inventory(scope), indent=2), encoding='utf-8')
    result = replay(scope, args.out, args.last, args.jump)
    result.update(seed=args.seed, jump=args.jump, last=args.last)
    args.out.with_suffix('.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    print(json.dumps({k:v for k,v in result.items() if k!='rng'} | {'events': len(result['events'])}))


if __name__ == '__main__':
    main()
