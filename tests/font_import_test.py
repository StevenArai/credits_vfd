from pathlib import Path
import tempfile,shutil,json,subprocess,sys
root=Path.cwd()
with tempfile.TemporaryDirectory() as folder:
 t=Path(folder);(t/'tools').mkdir();(t/'src').mkdir()
 for name in ['export_font.py','font-editor-data.json','font-editor.html']:shutil.copy(root/'tools'/name,t/'tools'/name)
 partial={'format':'credits-font-v1','width':3,'height':5,'glyphs':{'176':'100000000000000'}}
 (t/'single.json').write_text(json.dumps(partial))
 subprocess.run([sys.executable,str(t/'tools/export_font.py'),'--input',str(t/'single.json')],check=True)
 subprocess.run([sys.executable,str(t/'tools/export_font.py'),'--check'],check=True)
 assert len(json.loads((t/'tools/font-editor-data.json').read_text())['glyphs'])==96
 shutil.copy(root/'src/framebuffer.c',t/'src/framebuffer.c')
 (t/'probe.c').write_text('#include "framebuffer.h"\nint main(void){uint32_t cells[1920];for(int i=0;i<1920;i++)cells[i]=32|(39u<<16)|(49u<<22);cells[0]=176|(39u<<16)|(49u<<22);Framebuffer f;return framebuffer_render_case(&f,cells,0)!=0 || !framebuffer_pixel(&f,8,4) || framebuffer_pixel(&f,9,4);}\n')
 subprocess.run([str(root/'.tools/llvm-mingw-20260922-ucrt-x86_64/bin/clang.exe'),'-std=c99','-I'+str(root/'src'),str(t/'probe.c'),str(t/'src/framebuffer.c'),'-o',str(t/'probe.exe')],check=True)
 subprocess.run([str(t/'probe.exe')],check=True)
print('Temporary single-glyph import, retained ASCII, export check, compiled degree glyph rendering passed; project font unchanged.')
