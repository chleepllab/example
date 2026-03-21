#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
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
    %15 = flow.dispatch.workgroups[%0, %1, %2, %3, %5, %6, %7, %8, %10, %11, %12, %13](%4, %9, %14, %0, %1, %2, %3, %5, %6, %7, %8, %10, %11, %12, %13) : (tensor<?x?x?x?xf32>{%0, %1, %2, %3}, tensor<?x?x?x?xf32>{%5, %6, %7, %8}, tensor<?x?x?x?xf32>{%10, %11, %12, %13}, index, index, index, index, index, index, index, index, index, index, index, index) -> %14{%10, %11, %12, %13} =
        (%arg3: !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>, %arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index, %arg17: index) {
      %17 = iree_tensor_ext.dispatch.workload.ordinal %arg6, 0 : index
      %18 = iree_tensor_ext.dispatch.workload.ordinal %arg7, 1 : index
      %19 = iree_tensor_ext.dispatch.workload.ordinal %arg8, 2 : index
      %20 = iree_tensor_ext.dispatch.workload.ordinal %arg9, 3 : index
      %21 = iree_tensor_ext.dispatch.workload.ordinal %arg10, 4 : index
      %22 = iree_tensor_ext.dispatch.workload.ordinal %arg11, 5 : index
      %23 = iree_tensor_ext.dispatch.workload.ordinal %arg12, 6 : index
      %24 = iree_tensor_ext.dispatch.workload.ordinal %arg13, 7 : index
      %25 = iree_tensor_ext.dispatch.workload.ordinal %arg14, 8 : index
      %26 = iree_tensor_ext.dispatch.workload.ordinal %arg15, 9 : index
      %27 = iree_tensor_ext.dispatch.workload.ordinal %arg16, 10 : index
      %28 = iree_tensor_ext.dispatch.workload.ordinal %arg17, 11 : index
      %29 = iree_tensor_ext.dispatch.tensor.load %arg3, offsets = [0, 0, 0, 0], sizes = [%17, %18, %19, %20], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%17, %18, %19, %20} -> tensor<?x?x?x?xf32>
      %30 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 0, 0], sizes = [%21, %22, %23, %24], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%21, %22, %23, %24} -> tensor<?x?x?x?xf32>
      %31 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0, 0, 0], sizes = [%25, %26, %27, %28], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%25, %26, %27, %28} -> tensor<?x?x?x?xf32>
      %32 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%29, %30 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%31 : tensor<?x?x?x?xf32>) {
      ^bb0(%in: f32, %in_0: f32, %out: f32):
        %33 = arith.mulf %in, %in_0 : f32
        %34 = arith.addf %out, %33 : f32
        linalg.yield %34 : f32
      } -> tensor<?x?x?x?xf32>
      iree_tensor_ext.dispatch.tensor.store %32, %arg5, offsets = [0, 0, 0, 0], sizes = [%25, %26, %27, %28], strides = [1, 1, 1, 1] : tensor<?x?x?x?xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%25, %26, %27, %28}
      flow.return
    } count(%arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14)
      flow.return %x, %y, %z : index, index, index
    }
    %16 = hal.tensor.export %15 "output0" : tensor<?x?x?x?xf32>{%10, %11, %12, %13} -> !hal.buffer_view
    util.return %16 : !hal.buffer_view
  }
}
