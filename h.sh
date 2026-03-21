#!/bin/bash
cd ~/iree
cmake --build ../iree-build/ -- -j32
cmake --build ../iree-build-riscv/ -- -j32
cd ~/example
make clea
make compil
SRC2=$(grep '^SRC2 *:=' Makefile | awk '{print $3}')
TARGET=${SRC2%.mlir}.vmfb
scp "$TARGET" chlee@140.114.78.64:~/example/
scp ~/iree-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
scp ~/iree-build-riscv/tools/iree-benchmark-module chlee@140.114.78.64:~
ssh chlee@140.114.78.64 "cd example && make run-check"
#ssh chlee@140.114.78.64 "cd example && make t1 t2 t3 t4"
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
