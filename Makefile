IREE := ~/iree-build
IREE_V := ~/iree_v-build
IREE_RVV := ~/iree_rvv-build
IREE_RUN := ~/iree-build-riscv
IREE_V_RUN := ~/iree_v-build-riscv
IREE_RVV_RUN := ~/iree_rvv-build-riscv
QEMU_BIN=~/riscv/qemu/linux/RISCV/qemu-riscv64
RISCV_TOOLCHAIN_ROOT=~/riscv/toolchain/clang/linux/RISCV

SRC := conv_d.mlir
SRC2 := conv_s.mlir
SRC3 := matmul.mlir
#SRC3 := conv_s4.mlir
OUT_FILE = $(SRC:.mlir=.vmfb)
OUT_FILE2 = $(SRC2:.mlir=.vmfb)
OUT_FILE3 = $(SRC3:.mlir=.vmfb)
OUT_DIR = $(SRC:.mlir=)

L := --iree-hal-target-device=local
L += --iree-hal-local-target-device-backends=llvm-cpu
L += --iree-llvmcpu-target-triple=riscv64
L += --iree-llvmcpu-target-abi=lp64d
L += --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v"
L += --iree-llvmcpu-enable-ukernels=all
L += --mlir-disable-threading
L += --mlir-elide-elementsattrs-if-larger=10
L += --riscv-v-fixed-length-vector-lmul-max=8
M := --iree-hal-target-device=local
M += --iree-hal-local-target-device-backends=vmvx
M += --iree-llvmcpu-target-cpu=znver4
M += --iree-llvmcpu-enable-ukernels=all
N := --iree-hal-dump-executable-intermediates-to=$(OUT_DIR) --x86-asm-syntax=intel
O := --mlir-print-ir-after-all 2> log.log
C := -cpu rv64,Zve64d=true,vlen=512,elen=64,vext_spec=v1.0
D := -cpu rv64

.PHONY: compile compile_v compil compil_v compil_rvv compile3 compile3_v compile4 compile4_v run rc t1 t2 t3 t4 tun compile2 all runn clean clea
all: compile

compile:
	$(IREE)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --mlir-print-ir-after-all \
  2> log.log \
  $(SRC) -o $(OUT_FILE)
#  --mlir-print-ir-after-all \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_0=b/configured_module_matmul_static_dispatch_0.mlir \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_1=b/configured_module_matmul_static_dispatch_1.mlir \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_2=b/configured_module_matmul_static_dispatch_2.mlir \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_3=b/configured_module_matmul_static_dispatch_3.mlir \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_4=b/configured_module_matmul_static_dispatch_4.mlir \
  --iree-codegen-tuning-spec-path=matmul_spec.mlir \
  --iree-codegen-dump-tuning-specs-to=auto.mlir \
  -debug-only=iree-codegen-tuner \
  --mlir-print-ir-after=iree-codegen-materialize-host-encoding \
  2> log.log \
  --mlir-disable-threading \
  --mlir-elide-elementsattrs-if-larger=10 \
  --iree-config-add-tuner-attributes \
  --iree-codegen-enable-default-tuning-specs=true \

compile_v:
	$(IREE_V)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --iree-hal-dump-executable-configurations-to=dump \
  --debug-only=iree-cpu-encoding-external-models \
  $(SRC) -o $(OUT_FILE)

compil:
	$(IREE)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-hal-dump-executable-configurations-to=dump \
  --iree-llvmcpu-enable-scalable-vectorization \
  --iree-llvmcpu-loop-vectorization \
  --prefer-predicate-over-epilogue=predicate-else-scalar-epilogue \
  --riscv-v-vector-bits-min=256 \
  --riscv-v-fixed-length-vector-lmul-max=8 \
  --riscv-v-register-bit-width-lmul=8 \
  --force-tail-folding-style=data-with-evl \
  $(SRC2) -o $(OUT_FILE2)
#  --mlir-print-ir-after-all \
  --mlir-print-ir-after-all \
  2> old3.log \
  --iree-llvmcpu-enable-ukernels=all \
  --iree-llvmcpu-check-linalg-vectorization \
  --iree-llvmcpu-disable-vector-peeling \
  --iree-codegen-llvm-verbose-debug-info \

compil_v:
	$(IREE_V)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --iree-global-opt-experimental-disable-conv-generalization \
  --iree-hal-dump-executable-configurations-to=dump \
  $(SRC2) -o $(OUT_FILE2)

compil_rvv:
	$(IREE_RVV)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-hal-dump-executable-configurations-to=dump \
  --mlir-print-ir-after-all \
  2> log2.log \
  $(SRC2) -o $(OUT_FILE2)
#  --iree-llvmcpu-enable-ukernels=all \
  --debug-only=iree-cpu-encoding-external-models \

compile3:
	$(IREE)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --iree-hal-dump-executable-configurations-to=dump \
  --debug-only=iree-cpu-encoding-external-models \
  $(SRC3) -o $(OUT_FILE3)
#  --mlir-print-ir-after-all \

compile3_v:
	$(IREE_V)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --iree-hal-dump-executable-configurations-to=dump \
  --debug-only=iree-cpu-encoding-external-models \
  $(SRC3) -o $(OUT_FILE3)

compile4:
	$(IREE)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-llvmcpu-enable-ukernels=all \
  --mlir-print-ir-after-all \
  2> log4.log \
  $(SRC3) -o $(OUT_FILE3)
#  --mlir-print-ir-after=iree-dispatch-creation-convert-dispatch-regions-to-workgroups \
  --iree-hal-dump-executable-configurations-to=dump \

compile4_v:
	$(IREE_V)/tools/iree-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-triple=riscv64 \
  --iree-llvmcpu-target-abi=lp64d \
  --iree-llvmcpu-target-cpu-features="+m,+a,+f,+d,+zvl256b,+v" \
  --iree-hal-dump-executable-configurations-to=dump \
  --mlir-print-ir-after-all \
  2> log4_v.log \
  $(SRC3) -o $(OUT_FILE3)
#  --iree-llvmcpu-enable-ukernels=matmul \

run:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=256,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  $(IREE_RUN)/tools/iree-run-module \
  --device=local-task \
  --module=$(OUT_FILE) \
  --function=matmul_dynamic \
  --input="24x2xf32=[ [0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13],[14,15], \
  [16,17],[18,19],[20,21],[22,23],[24,25],[26,27],[28,29],[30,31], \
  [32,33],[34,35],[36,37],[38,39],[40,41],[42,43],[44,45],[46,47] ]"
#  --input="1024x2048xf32=1" \
  --input="32x2048xf32=0" \
  --input="2x3xf32=[[1,2,3],[4,5,6]]" \
  --input="3x2xf32=[[1,2],[3,4],[5,6]]" \
  --input="2x2xf32=[[0,0],[0,0]]" \
  --input="1x2x5x5xf32=[[[[1,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]],[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,2,0],[0,0,0,0,0],[0,0,0,0,0]]]]" \
  --input="3x2x3x3xf32=[[[[1,1,1],[1,1,1],[1,1,1]],[[1,1,1],[1,1,1],[1,1,3]]],[[[1,1,1],[1,1,1],[1,1,1]],[[1,1,1],[1,1,1],[1,1,1]]],[[[1,1,1],[1,1,1],[1,1,1]],[[1,1,1],[1,1,1],[1,1,1]]]]" \
  --input="1x3x3x3xf32=0"

run-check:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=256,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  $(IREE_V_RUN)/tools/iree-run-module \
  --device=local-task \
  --module=$(OUT_FILE2) \
  --function=conv_dynamic \
  --input="1x1x6x6xf32=[[[1,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,2,0]]]" \
  --input="1x1x3x3xf32=[[[[1,1,1],[1,1,1],[1,1,3]]]]" \
  --input="1x1x4x4xf32=0"
#  --input="1x2x6x6xf32=1" \
  --input="4x2x3x3xf32=1" \
  --input="1x4x4x4xf32=0" \
  1x1x4x4xf32=[[[1 0 0 0][0 0 0 0][0 0 0 0][0 0 6 2]]]

t1:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=512,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  ~/iree-build-riscv/tools/iree-benchmark-module \
  --device=local-task \
  --module=$(OUT_FILE) \
  --function=matmul_dynamic \
  --input="64x1024xf32=1" \
  --input="1024x4096xf32=1" \
  --input="64x4096xf32=0" \
  --benchmark_repetitions=1 \
  --task_topology_group_count=1 \
  --benchmark_out=benchmark_results.json

t2:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=512,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  ~/iree-build-riscv/tools/iree-benchmark-module \
  --device=local-task \
  --module=$(OUT_FILE) \
  --function=matmul_dynamic \
  --input="64x2048xf32=1" \
  --input="2048x4096xf32=1" \
  --input="64x4096xf32=0" \
  --benchmark_repetitions=1 \
  --task_topology_group_count=1 \
  --benchmark_out=benchmark_results.json

t3:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=512,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  ~/iree-build-riscv/tools/iree-benchmark-module \
  --device=local-task \
  --module=$(OUT_FILE) \
  --function=matmul_dynamic \
  --input="64x4096xf32=1" \
  --input="4096x4096xf32=1" \
  --input="64x4096xf32=0" \
  --benchmark_repetitions=1 \
  --task_topology_group_count=1 \
  --benchmark_out=benchmark_results.json

t4:
	~/riscv/qemu/linux/RISCV/qemu-riscv64 -cpu rv64,v=true,vlen=512,elen=64,vext_spec=v1.0 \
  -L /home/chlee/riscv/toolchain/clang/linux/RISCV/sysroot \
  ~/iree-build-riscv/tools/iree-benchmark-module \
  --device=local-task \
  --module=$(OUT_FILE) \
  --function=matmul_dynamic \
  --input="64x4096xf32=1" \
  --input="4096x8192xf32=1" \
  --input="64x8192xf32=0" \
  --benchmark_repetitions=1 \
  --task_topology_group_count=1 \
  --benchmark_out=benchmark_results.json

tun:
	~/iree-build/tools/iree-benchmark-module \
  --device=vulkan \
  --module=$(OUT_FILE) \
  --function=matmul_static \
  --input=32x1024xf32=1 \
  --input=1024x2048xf32=1 \
  --input=32x2048xf32=0 \
  --benchmark_repetitions=1 \
  --task_topology_group_count=1 \
  --benchmark_out=benchmark_results.json

compile2:
	~/iree-build/tools/iree-compile \
  --iree-hal-target-device=vulkan \
  --iree-config-add-tuner-attributes \
  --iree-codegen-enable-default-tuning-specs=true \
  --iree-hal-substitute-executable-configuration=matmul_static_dispatch_0=v/configured_module_matmul_static_dispatch_0.mlir \
  $(SRC) -o $(OUT_FILE)
#  --riscv-v-fixed-length-vector-lmul-max=8 \
  --iree-hal-dump-executable-configurations-to=v \
  --iree-codegen-tuning-spec-path=spec.mlir \
  --iree-codegen-dump-tuning-specs-to=- \
#$(QEMU_BIN) $(D) -L $(RISCV_TOOLCHAIN_ROOT)/sysroot/ $(IREE_RUN) --device=local-task --module=$(OUT_FILE) --function=matmul_dynamic --input="2x3xf32=1,2,3,4,5,6" --input="3x4xf32=7,8,9,10,11,12,13,14,15,16,17,18" --input="2x4xf32=0"
#$(CXX) -S -O3 -emit-llvm -menable-experimental-extensions -mllvm --scalable-vectorization=preferred -mllvm -riscv-v-vector-bits-min=128 --target=riscv64-unknown-elf -march=rv64gcv1p0 -o $(IR_FILE) $(SRC)
#  --iree-codegen-llvmcpu-default-tile-sizes=8,8
#  --input=8x8xi32=[[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8]] \
#  --input=8x1xi32=[[1],[2],[3],[4],[5],[6],[7],[8]] \
#  --input=8x8xi32=[[1,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0],[0,0,1,0,0,0,0,0],[0,0,0,1,0,0,0,0],[0,0,0,0,1,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,0,0,1,0],[0,0,0,0,0,0,0,1]] \
#  --input=8x8xi32=[[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
#-mllvm -scalable-vectorization=only --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions -O3 -mllvm --scalable-vectorization=preferred -mllvm -riscv-v-vector-bits-min=128 -o $(IR_FILE) $(SRC)

runn:
	$(IREE) $(L) $(SRC) -o $(OUT_FILE)
	$(QEMU_BIN) $(C) -L $(RISCV_TOOLCHAIN_ROOT)/sysroot/ $(IREE_RUN) --device=local-task --module=$(OUT_FILE) --function=forward --input="1x3x32x32xf32=1"

clean:
	rm -f $(OUT_FILE)

clea:
	rm -f $(OUT_FILE2)

cle:
	rm -f $(OUT_FILE3)
