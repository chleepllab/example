#!/bin/bash
cd ~/iree
cmake --build ../iree-build/ -- -j32
cmake --build ../iree-build-riscv/ -- -j32
cd ~/example
make clea
~/iree-build/runtime/src/iree/builtins/ukernel/tools/pack_test
#scp ~/iree-build-riscv/tools/iree-run-module chlee@140.114.78.64:~
#scp ~/iree-build-riscv/runtime/src/iree/builtins/ukernel/tools/pack_test chlee@140.114.78.64:~
#ssh chlee@140.114.78.64 ./conv_2d_nchw_fchw_test
#ssh chlee@140.114.78.64 make t5 t6 t7 t8
