import subprocess,sys
first=subprocess.check_output([sys.argv[1]],text=True)
second=subprocess.check_output([sys.argv[2]],text=True)
assert first==second,(first,second)
print('Separate implementation/consumer TUs match modular library:',first.strip())
