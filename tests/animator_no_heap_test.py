import re,subprocess,sys
symbols=subprocess.check_output([sys.argv[1],'--undefined-only',sys.argv[2]],text=True)
assert not re.search(r'\b(?:malloc|calloc|realloc|free)\b',symbols),symbols
print('Amalgamated implementation has no malloc/calloc/realloc/free imports; libc internals remain target-dependent')
