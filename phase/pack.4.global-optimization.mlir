#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  util.func public @matmul_dynamic(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @matmul_dynamic(%input0: tensor<?x?xf32>) -> (%output0: tensor<?x?x8x1xf32>)"}} {
    %c8 = arith.constant 8 : index
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<?x?xf32>{%0, %1}
    %3 = iree_tensor_ext.compute_barrier.start %2 : tensor<?x?xf32>{%0, %1} -> tensor<?x?xf32>
    %4 = arith.ceildivsi %0, %c8 : index
    %5 = tensor.empty(%4, %1) : tensor<?x?x8x1xf32>
    %pack = linalg.pack %3 inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %5 : tensor<?x?xf32> -> tensor<?x?x8x1xf32>
    %6 = iree_tensor_ext.compute_barrier.end %pack : tensor<?x?x8x1xf32>{%4, %1} -> tensor<?x?x8x1xf32>
    %7 = hal.tensor.export %6 "output0" : tensor<?x?x8x1xf32>{%4, %1} -> !hal.buffer_view
    util.return %7 : !hal.buffer_view
  }
}
