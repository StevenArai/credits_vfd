"""Verify archived reference blobs without depending on checkout line endings."""
from pathlib import Path
import json,subprocess
root=Path(__file__).resolve().parents[1]
manifest=json.loads((root/'archive/python-manifest.json').read_text())
for original,entry in manifest['files'].items():
    archived=root/'archive/python'/original
    actual=subprocess.check_output(['git','hash-object','--path',original,str(archived)],cwd=root,text=True).strip()
    assert actual==entry['git_blob'],original
print(f"{len(manifest['files'])} archived reference blobs unchanged")
