#!/bin/bash
cd ~/iree_v
cmake --build ../iree_v-build/ -- -j32
cmake --build ../iree_v-build-riscv/ -- -j32
cd ~/example
make clean
make compile_v
SRC=$(grep '^SRC *:=' Makefile | awk '{print $3}')
TARGET=${SRC%.mlir}.vmfb
scp "$TARGET" chlee@140.114.78.64:~/example/
scp ~/iree_v-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
scp ~/iree_v-build-riscv/tools/iree-benchmark-module chlee@140.114.78.64:~
ssh chlee@140.114.78.64 "cd example && make run-check"
#ssh chlee@140.114.78.64 "cd example && make t1 t2 t3 t4"
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
