"""Validate editable 3x5 fonts and export C data; never execute imported content."""
from pathlib import Path
import argparse,json,re
ROOT=Path(__file__).resolve().parents[1]
def validate(d):
    if not isinstance(d,dict) or d.get('format')!='credits-font-v1' or d.get('width')!=3 or d.get('height')!=5 or not isinstance(d.get('glyphs'),dict):
        raise ValueError('expected credits-font-v1, 3x5, glyphs object')
    out={}
    for key,bits in d['glyphs'].items():
        if not isinstance(key,str) or not key.isascii() or not key.isdecimal(): raise ValueError('invalid codepoint')
        cp=int(key)
        if not 32<=cp<=65535 or 0xd800<=cp<=0xdfff or cp==160: raise ValueError('unsupported codepoint (NBSP is fixed space)')
        if not isinstance(bits,str) or not re.fullmatch('[01]{15}',bits): raise ValueError('glyph must have 15 binary pixels')
        out[str(cp)]=bits
    if not out: raise ValueError('empty font')
    return out

def main():
    p=argparse.ArgumentParser();p.add_argument('--input',type=Path);p.add_argument('--check',action='store_true');args=p.parse_args()
    if args.input and args.check: p.error('choose --input or --check')
    path=ROOT/'tools/font-editor-data.json';data=json.loads(path.read_text(encoding='utf-8'));g=validate(data)
    if args.input:
        incoming=validate(json.loads(args.input.read_text(encoding='utf-8-sig')))
        g=incoming if all(str(c) in incoming for c in range(32,127)) else {**g,**incoming}
    if not all(str(c) in g for c in range(32,127)): raise ValueError('all 95 ASCII glyphs required')
    data={'format':'credits-font-v1','width':3,'height':5,'glyphs':dict(sorted(g.items(),key=lambda item:int(item[0])))}
    serialized=json.dumps(data,ensure_ascii=False,indent=2)+'\n'
    ascii_data='/* ASCII 32..126, row-major 3x5; exported from user font. */\n'+','.join('0x%04x'%int(g[str(c)],2) for c in range(32,127))+'\n'
    extras='/* Additional user glyphs; codepoint zero terminates the table. */\n'+''.join('{%d,0x%04x},\n'%(int(c),int(b,2)) for c,b in data['glyphs'].items() if int(c)>126)+'{0,0}\n'
    editor=ROOT/'tools/font-editor.html';html=editor.read_text(encoding='utf-8')
    html=re.sub(r'(<script id="builtin" type="application/json">)[\s\S]*?(</script>)',lambda m:m[1]+serialized+m[2],html,count=1)
    outputs={path:serialized,ROOT/'src/font_generated.inc':ascii_data,ROOT/'src/font_extra_generated.inc':extras,editor:html}
    for file,content in outputs.items():
        if args.check:
            if file.read_text(encoding='utf-8')!=content: raise ValueError('stale font output: '+str(file))
        else: file.write_text(content,encoding='utf-8')
    print(f'{len(g)} glyphs verified' if args.check else f'{len(g)} glyphs exported; rebuild the C player to apply')
if __name__=='__main__': main()
