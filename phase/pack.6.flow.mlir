#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  flow.executable private @matmul_dynamic_dispatch_0 {
    flow.executable.export public @matmul_dynamic_dispatch_0_pack_f32 workgroups(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg0, %arg1, %arg2)
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_0_pack_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>, %arg1: index, %arg2: index, %arg3: index, %arg4: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x8x1xf32>>) {
        %0 = iree_tensor_ext.dispatch.workload.ordinal %arg1, 0 : index
        %1 = iree_tensor_ext.dispatch.workload.ordinal %arg2, 1 : index
        %2 = iree_tensor_ext.dispatch.workload.ordinal %arg3, 2 : index
        %3 = flow.dispatch.tie_shape %arg0 : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%0, %2}
        %4 = flow.dispatch.tie_shape %arg4 : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x8x1xf32>>{%1, %2}
        %5 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0, 0], sizes = [%0, %2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%0, %2} -> tensor<?x?xf32>
        %6 = tensor.empty(%1, %2) : tensor<?x?x8x1xf32>
        %pack = linalg.pack %5 inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %6 : tensor<?x?xf32> -> tensor<?x?x8x1xf32>
        iree_tensor_ext.dispatch.tensor.store %pack, %4, offsets = [0, 0, 0, 0], sizes = [%1, %2, 8, 1], strides = [1, 1, 1, 1] : tensor<?x?x8x1xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x8x1xf32>>{%1, %2}
        return
      }
    }
  }
  util.func public @matmul_dynamic(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @matmul_dynamic(%input0: tensor<?x?xf32>) -> (%output0: tensor<?x?x8x1xf32>)"}} {
    %c8 = arith.constant 8 : index
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<?x?xf32>{%0, %1}
    %3 = arith.ceildivsi %0, %c8 : index
    %4 = flow.dispatch @matmul_dynamic_dispatch_0::@matmul_dynamic_dispatch_0_pack_f32[%0, %3, %1](%2, %0, %3, %1) : (tensor<?x?xf32>{%0, %1}, index, index, index) -> tensor<?x?x8x1xf32>{%3, %1}
    %5 = hal.tensor.export %4 "output0" : tensor<?x?x8x1xf32>{%3, %1} -> !hal.buffer_view
    util.return %5 : !hal.buffer_view
  }
}
