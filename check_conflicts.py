import re, glob

builtins = set(re.findall(r'strcmp\(fc->name,"(\w+)"\)', open('src/t_vm.c').read()))
all_t = ''
for f in glob.glob('lib/**/*.t', recursive=True):
    all_t += open(f).read()
tfuncs = re.findall(r'^func (\w+)', all_t, re.M)
conflicts = [f for f in tfuncs if f in builtins]
if conflicts:
    print('CONFLICT WARNING:', conflicts)
    exit(1)
else:
    print('OK: No name conflicts')

# Check duplicates
import glob
all_funcs = {}
for f in sorted(glob.glob('lib/**/*.t', recursive=True)):
    if 'std.t' in f: continue
    for fn in re.findall(r'^func (\w+)', open(f).read(), re.M):
        all_funcs.setdefault(fn, []).append(f.split('lib/')[1])
dups = {fn: files for fn, files in all_funcs.items() if len(files) > 1}
if dups:
    print('DUPLICATE WARNING:', dups)
    exit(1)
else:
    print('OK: No duplicates')

# Check syntax of all .t files
import subprocess
errors = []
for f in sorted(glob.glob('lib/**/*.t', recursive=True)):
    if 'std.t' in f: continue
    r = subprocess.run(['./t', f], capture_output=True, text=True, timeout=3)
    if 'Parse error' in r.stdout or 'Parse error' in r.stderr:
        errors.append(f + ': ' + (r.stdout + r.stderr)[:80])
if errors:
    print('SYNTAX ERRORS:')
    for e in errors: print(' ', e)
    exit(1)
else:
    print('OK: No syntax errors')
