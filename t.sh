#!/bin/bash
cd ~/iree_t
cmake --build ../iree_t-build/ -- -j32
cmake --build ../iree_t-build-riscv/ -- -j32
cd ~/example
kernels=(
    matmul_f32_64
    matmul_f32_128
    matmul_f32_256
    matmul_f32_512
    matmul_f32_1024
)
scp ~/iree_t-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
scp ~/iree_t-build-riscv/tools/iree-benchmark-module chlee@140.114.78.64:~
for kernel in "${kernels[@]}";
do
    make clean-"$kernel"
    make cr-"$kernel"
    TARGET=${kernel}.vmfb
    scp "$TARGET" chlee@140.114.78.64:~/example/
    ssh chlee@140.114.78.64 "cd example && make p-${kernel}"
    #make r-"$kernel"
done
#ssh chlee@140.114.78.64 "cd example && make t1 t2 t3 t4"
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
