#!/bin/bash
cd ~/iree_rvv
cmake --build ../iree_rvv-build/ -- -j32
cmake --build ../iree_rvv-build-riscv/ -- -j32
cd ~/example
make clea
make compil_rvv
SRC=$(grep '^SRC2 *:=' Makefile | awk '{print $3}')
TARGET=${SRC%.mlir}.vmfb
scp "$TARGET" chlee@140.114.78.64:~/example/
scp ~/iree_rvv-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
scp ~/iree_rvv-build-riscv/tools/iree-benchmark-module chlee@140.114.78.64:~
ssh chlee@140.114.78.64 "cd example && make t3 t4"
#ssh chlee@140.114.78.64 "cd example && make t11 t12 t15 t16"
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
