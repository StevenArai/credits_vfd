"""Measure native RAM ownership. ARM output is a compile-only ABI probe, not firmware.

Builds two host diagnostics (plain and scratch-counter copy), replays three seeds
and six starts, and requires identical chars/framebuffer/main-RNG digests.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
from profile_core import NATIVE, ROOT

MEMBERS = {
    'CreditsAnimator': '_core _player _fb _config _generation _missing _initialized _dirty _finished'.split(),
    'Credits': 'memory canvas random scheduler scenes active texts typers oceans ocean_time weather history refresh progress access_counter access_block beat_toggle jump scratch scratch_capacity frames events_executed trace_event trace_context draw_scene draw_generator storage'.split(),
}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--cc', required=True)
    p.add_argument('--out', default='build/profile-ram')
    args = p.parse_args()
    out = (ROOT / args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    common = ['-std=c99', '-DCREDITS_DIRECT60=1', '-I', str(ROOT / 'src')]
    code = '#include "animator.h"\n#include <stddef.h>\n'
    for t, fields in MEMBERS.items():
        code += f'const unsigned size_{t}=sizeof({t});\n'
        for m in fields:
            code += f'const unsigned member_{t}_{m}=sizeof((({t}*)0)->{m});\n'
            code += f'const unsigned offset_{t}_{m}=offsetof({t},{m});\n'
    for t in ('WordLine', 'HistoryEntry', 'Text', 'Ocean', 'Weather', 'Random'):
        code += f'const unsigned size_{t}=sizeof({t});\n'
    code += 'const unsigned pointer_bytes=sizeof(void*);\n'
    probe = out / 'ram-abi.c'
    probe.write_text(code)
    abi = {}
    for target, flags in [('host', []), ('cortex-m3', ['-target', 'arm-none-eabi', '-mcpu=cortex-m3', '-mfloat-abi=soft'])]:
        ir = out / f'abi-{target}.ll'
        subprocess.run([args.cc, *flags, *common, '-S', '-emit-llvm', str(probe), '-o', str(ir)], check=True)
        values = {k: int(v) for k, v in re.findall(r'@(\w+) = .*?constant i32 (\d+)', ir.read_text())}
        sizes = {}
        for t, fields in MEMBERS.items():
            rows = [{'member': m, 'offset': values[f'offset_{t}_{m}'], 'bytes': values[f'member_{t}_{m}']} for m in fields]
            total = values[f'size_{t}']
            sizes[t] = dict(bytes=total, members=rows, padding=total-sum(r['bytes'] for r in rows))
        abi[target] = dict(objects=sizes, types={t: values[f'size_{t}'] for t in ('WordLine', 'HistoryEntry', 'Text', 'Ocean', 'Weather', 'Random')}, pointer_bytes=values['pointer_bytes'])
    (out / 'abi.json').write_text(json.dumps(abi, indent=2))

    source = (ROOT / 'src/credits.c').read_text(encoding='utf-8')
    marker = 'char *credits_scratch(Credits *a,size_t size) {'
    assert source.count(marker) == 1
    source = source.replace(marker, 'void ram_scratch_request(size_t bytes);\n'+marker+'\n    ram_scratch_request(size);')
    (out / 'credits-counted.c').write_text(source, encoding='utf-8')
    reports = {}
    for counted in (False, True):
        kind = 'counted' if counted else 'plain'
        exe = out / f'ram-{kind}.exe'
        sources = [out / 'credits-counted.c' if counted and m == 'credits' else ROOT / f'src/{m}.c' for m in NATIVE]
        subprocess.run([args.cc, *common, '-O3', '-ffp-contract=off', *map(str, sources), str(ROOT / 'tools/profile_ram.c'), '-o', str(exe)], check=True)
        reports[kind] = []
        for seed in (0, 1, 42):
            for jump in range(1, 7):
                result = subprocess.run([str(exe), str(seed), str(jump)], capture_output=True, text=True, check=True)
                data = json.loads(result.stdout)
                assert data['live_after_destroy'] == 0
                reports[kind].append(data)
        (out / f'{kind}.json').write_text(json.dumps(reports[kind], indent=2))
    for a, b in zip(reports['plain'], reports['counted']):
        assert a['digest'] == b['digest'], 'instrumentation changed output'

    first = reports['counted'][0]
    reservations = []
    for t in first['texts']:
        reservations.append((t['name']+'.raw', t['raw_bytes'], None, t['raw_offset']))
        if t['lines']:
            reservations.append((t['name']+'.lines', t['lines'], 'WordLine', t['lines_offset']))
    reservations.append(('scratch', first['scratch_capacity'], None, None))
    reservations.extend((f'history[{i}]', cap, 'HistoryEntry', None) for i, cap in enumerate(first['history_capacity']))
    workspace = {}
    for target in abi:
        ptr = abi[target]['pointer_bytes']
        offset = payload = 0
        rows = []
        for name, count, t, observed in reservations:
            size = count * (abi[target]['types'][t] if t else 1)
            offset = (offset+ptr-1)//ptr*ptr
            if target == 'host' and observed is not None:
                assert offset == observed, (name, offset, observed)
            rows.append(dict(name=name, offset=offset, bytes=size))
            offset += size
            payload += size
        capacity = next(x['bytes'] for x in abi[target]['objects']['Credits']['members'] if x['member'] == 'storage')
        workspace[target] = dict(reservations=rows, payload=payload, used=offset, internal_alignment=offset-payload, storage_bytes=capacity, unused_storage=capacity-offset)
        if target == 'host':
            assert offset == first['workspace_used'] and payload == first['reserved_payload']
    summary = dict(abi=abi, workspace=workspace,
                   replays=len(reports['counted']), frames=sum(x['frames'] for x in reports['counted']),
                   scratch_requested_peak=max(x['scratch_requested_peak'] for x in reports['counted']),
                   history_peak=[max(x['history_peak'][i] for x in reports['counted']) for i in range(3)],
                   history_concurrent_peak=max(x['history_concurrent_peak'] for x in reports['counted']))
    (out / 'summary.json').write_text(json.dumps(summary, indent=2))
    print(json.dumps({k: v for k, v in summary.items() if k not in ('abi', 'workspace')}, indent=2))
    print(out)


if __name__ == '__main__':
    main()
