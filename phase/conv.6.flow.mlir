#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  flow.executable private @conv_dynamic_dispatch_0 {
    flow.executable.export public @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32 workgroups(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11)
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index) {
        %0 = iree_tensor_ext.dispatch.workload.ordinal %arg3, 0 : index
        %1 = iree_tensor_ext.dispatch.workload.ordinal %arg4, 1 : index
        %2 = iree_tensor_ext.dispatch.workload.ordinal %arg5, 2 : index
        %3 = iree_tensor_ext.dispatch.workload.ordinal %arg6, 3 : index
        %4 = iree_tensor_ext.dispatch.workload.ordinal %arg7, 4 : index
        %5 = iree_tensor_ext.dispatch.workload.ordinal %arg8, 5 : index
        %6 = iree_tensor_ext.dispatch.workload.ordinal %arg9, 6 : index
        %7 = iree_tensor_ext.dispatch.workload.ordinal %arg10, 7 : index
        %8 = iree_tensor_ext.dispatch.workload.ordinal %arg11, 8 : index
        %9 = iree_tensor_ext.dispatch.workload.ordinal %arg12, 9 : index
        %10 = iree_tensor_ext.dispatch.workload.ordinal %arg13, 10 : index
        %11 = iree_tensor_ext.dispatch.workload.ordinal %arg14, 11 : index
        %12 = flow.dispatch.tie_shape %arg0 : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%0, %1, %2, %3}
        %13 = flow.dispatch.tie_shape %arg1 : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%4, %5, %6, %7}
        %14 = flow.dispatch.tie_shape %arg2 : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%8, %9, %10, %11}
        %15 = iree_tensor_ext.dispatch.tensor.load %12, offsets = [0, 0, 0, 0], sizes = [%0, %1, %2, %3], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%0, %1, %2, %3} -> tensor<?x?x?x?xf32>
        %16 = iree_tensor_ext.dispatch.tensor.load %13, offsets = [0, 0, 0, 0], sizes = [%4, %5, %6, %7], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%4, %5, %6, %7} -> tensor<?x?x?x?xf32>
        %17 = iree_tensor_ext.dispatch.tensor.load %14, offsets = [0, 0, 0, 0], sizes = [%8, %9, %10, %11], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%8, %9, %10, %11} -> tensor<?x?x?x?xf32>
        %18 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%15, %16 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%17 : tensor<?x?x?x?xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %19 = arith.mulf %in, %in_0 : f32
          %20 = arith.addf %out, %19 : f32
          linalg.yield %20 : f32
        } -> tensor<?x?x?x?xf32>
        iree_tensor_ext.dispatch.tensor.store %18, %14, offsets = [0, 0, 0, 0], sizes = [%8, %9, %10, %11], strides = [1, 1, 1, 1] : tensor<?x?x?x?xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%8, %9, %10, %11}
        return
      }
    }
  }
  util.func public @conv_dynamic(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @conv_dynamic(%input0: tensor<?x?x?x?xf32>, %input1: tensor<?x?x?x?xf32>, %input2: tensor<?x?x?x?xf32>) -> (%output0: tensor<?x?x?x?xf32>)"}} {
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[2] : index
    %3 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[3] : index
    %4 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%0, %1, %2, %3}
    %5 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[0] : index
    %6 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[1] : index
    %7 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[2] : index
    %8 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[3] : index
    %9 = hal.tensor.import %arg1 "input1" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%5, %6, %7, %8}
    %10 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[0] : index
    %11 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[1] : index
    %12 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[2] : index
    %13 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[3] : index
    %14 = hal.tensor.import %arg2 "input2" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%10, %11, %12, %13}
    %15 = flow.dispatch @conv_dynamic_dispatch_0::@conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32[%0, %1, %2, %3, %5, %6, %7, %8, %10, %11, %12, %13](%4, %9, %14, %0, %1, %2, %3, %5, %6, %7, %8, %10, %11, %12, %13) : (tensor<?x?x?x?xf32>{%0, %1, %2, %3}, tensor<?x?x?x?xf32>{%5, %6, %7, %8}, tensor<?x?x?x?xf32>{%10, %11, %12, %13}, index, index, index, index, index, index, index, index, index, index, index, index) -> %14{%10, %11, %12, %13}
    %16 = hal.tensor.export %15 "output0" : tensor<?x?x?x?xf32>{%10, %11, %12, %13} -> !hal.buffer_view
    util.return %16 : !hal.buffer_view
  }
}
