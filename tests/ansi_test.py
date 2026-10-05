"""Hand-checked terminal states, independent of the C canvas implementation."""
from reference import Terminal

def check():
    t=Terminal()
    t.feed('\x1b[1;1H\x1b[1;39m\x1b[31mA°\u00a0\x1b[22mB')
    assert t.cells[:4]==[ord(c)|31<<16|49<<22|s<<28 for c,s in [('A',1),('°',1),('\u00a0',1),('B',0)]]
    t.feed('\x1b[2;80HX\nY')
    assert t.cells[159]&65535==ord('X')
    assert t.cells[160]&65535==ord('Y')
    t.feed('\x1b[24;80HE\nclipped\x1b[27;0H\n')
    assert t.cells[1919]&65535==ord('E')
    t.feed('\x1b[1;1H\x1b[1;39m'+' '*80+'\n')
    assert t.cells[:80]==[32|39<<16|49<<22|1<<28]*80
    print('ANSI parser: hand-checked Unicode, SGR inheritance, CRLF boundary and footer clipping pass')
if __name__=='__main__':check()
