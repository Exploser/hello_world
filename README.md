Just a simple hello world in assembly.

compile with
  as {filename}.s -o {filename}.o

run with:
  gcc -o {name} {filename}.o -nostdlib -static 
