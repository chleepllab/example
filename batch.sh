#!/bin/bash
cd ~/iree
cmake --build ../iree-build/ -- -j32
cmake --build ../iree-build-riscv/ -- -j32
cd ~/example
kernels=(
    _pack_8x4
)
scp ~/iree-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
scp ~/iree-build-riscv/tools/iree-benchmark-module chlee@140.114.78.64:~
for kernel in "${kernels[@]}";
do
    make clea
    make c-"$kernel"
    TARGET=${kernel}.vmfb
    scp "$TARGET" chlee@140.114.78.64:~/example/
    ssh chlee@140.114.78.64 "cd example && make p1-${kernel}"
done
#ssh chlee@140.114.78.64 "cd example && make t1 t2 t3 t4"
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
