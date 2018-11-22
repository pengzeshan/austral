#!/usr/bin/env bash
set -e
set -o pipefail

make boreal
make test

echo "test.au"
./boreal test/valid/test.au --output=test/valid/test.c --entrypoint=austral-user:test
gcc test/valid/test.c -o test/valid/test.bin
./test/valid/test.bin

echo "fib.au"
./boreal test/valid/fib.au --output=test/valid/fib.c --entrypoint=austral-user:main
gcc test/valid/fib.c -o test/valid/fib.bin
./test/valid/fib.bin

echo "tuple.au"
./boreal test/valid/tuple.au --output=test/valid/tuple.c --entrypoint=austral-user:main
gcc test/valid/tuple.c -o test/valid/tuple.bin
./test/valid/tuple.bin

#echo "class.au"
#./boreal test/valid/class.au --output=test/valid/class.c
# clang++ -shared -fPIC -std=c++11 test/valid/class.cpp

echo "string.au"
./boreal test/valid/string.au --output=test/valid/string.c --entrypoint=austral-user:main
gcc test/valid/string.c -o test/valid/string.bin
./test/valid/string.bin

echo "hello-world.au"
./boreal test/valid/hello-world.au --output=test/valid/hello-world.c --entrypoint=austral-user:main
gcc test/valid/hello-world.c -o test/valid/hello-world.bin
./test/valid/hello-world.bin

echo "generic.au"
./boreal test/valid/generic.au --output=test/valid/generic.c --entrypoint=austral-user:main
gcc test/valid/generic.c -o test/valid/generic.bin
./test/valid/generic.bin

echo "size-of.au"
./boreal test/valid/size-of.au --output=test/valid/size-of.c
gcc -c test/valid/size-of.c -o test/valid/size-of.bin

echo "memory.au"
./boreal test/valid/memory.au --output=test/valid/memory.c --entrypoint=austral-user:main
gcc test/valid/memory.c -o test/valid/memory.bin
./test/valid/memory.bin

# echo "cffi.au"
# ./boreal test/valid/cffi.au --output=test/valid/cffi.cpp --entrypoint=cffi-test:main
# clang++ -std=c++11 test/valid/cffi.cpp -o test/valid/cffi.bin
# ./test/valid/cffi.bin

echo "compare.au"
./boreal test/valid/compare.au --output=test/valid/compare.c --entrypoint=austral-user:main
gcc test/valid/compare.c -o test/valid/compare.bin
./test/valid/compare.bin

echo "defdatatype.au"
./boreal test/valid/defdatatype.au --output=test/valid/defdatatype.c --entrypoint=austral-user:main
gcc test/valid/defdatatype.c -o test/valid/defdatatype.bin
./test/valid/defdatatype.bin

echo "bind.au"
./boreal test/valid/bind.au --output=test/valid/bind.c --entrypoint=austral-user:main
gcc test/valid/bind.c -o test/valid/bind.bin
./test/valid/bind.bin

echo "case.au"
./boreal test/valid/case.au --output=test/valid/case.c --entrypoint=austral-user:main
gcc test/valid/case.c -o test/valid/case.bin
./test/valid/case.bin

echo "sqlite3.au"
./boreal test/valid/sqlite3.au --output=test/valid/sqlite3.c --entrypoint=sqlite3-test:main
gcc test/valid/sqlite3.c -o test/valid/sqlite3.bin -lsqlite3
./test/valid/sqlite3.bin
