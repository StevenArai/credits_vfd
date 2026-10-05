"""Extract saved glyph data without executing HTML/JavaScript."""
from pathlib import Path
import re
import sys
root = Path(__file__).resolve().parents[1]
patterns = re.search(r"saveData\s*=\s*'([01,]+)'", (root/'3x5fonts.html').read_text(encoding='utf-8')).group(1).split(',')
assert len(patterns) == 95 and all(len(p) == 15 for p in patterns)
content = '/* ASCII 32..126, row-major 3x5; exported from user font. */\n' + ','.join('0x%04x' % int(p, 2) for p in patterns) + '\n'
path = root/'src/font_generated.inc'
if '--check' in sys.argv:
    assert path.read_text() == content, 'font export differs'
else:
    path.write_text(content)
print('95 ASCII glyphs verified')
