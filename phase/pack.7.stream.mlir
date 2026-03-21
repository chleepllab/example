#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  stream.executable private @matmul_dynamic_dispatch_0 {
    stream.executable.export public @matmul_dynamic_dispatch_0_pack_f32 workgroups(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg0, %arg1, %arg2)
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_0_pack_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32) {
        %c0 = arith.constant 0 : index
        %c32_i64 = arith.constant 32 : i64
        %0 = arith.extui %arg2 : i32 to i64
        %1 = arith.extui %arg3 : i32 to i64
        %2 = arith.shli %1, %c32_i64 : i64
        %3 = arith.ori %0, %2 : i64
        %4 = arith.index_castui %3 : i64 to index
        %5 = arith.extui %arg4 : i32 to i64
        %6 = arith.extui %arg5 : i32 to i64
        %7 = arith.shli %6, %c32_i64 : i64
        %8 = arith.ori %5, %7 : i64
        %9 = arith.index_castui %8 : i64 to index
        %10 = arith.extui %arg6 : i32 to i64
        %11 = arith.extui %arg7 : i32 to i64
        %12 = arith.shli %11, %c32_i64 : i64
        %13 = arith.ori %10, %12 : i64
        %14 = arith.index_castui %13 : i64 to index
        %15:3 = util.assume.int 
            %4<umin = 0, umax = 9007199254740991>, 
            %9<umin = 0, umax = 1125899906842624>, 
            %14<umin = 0, umax = 9007199254740991>
          : index, index, index
        %16 = iree_tensor_ext.dispatch.workload.ordinal %15#0, 0 : index
        %17 = iree_tensor_ext.dispatch.workload.ordinal %15#1, 1 : index
        %18 = iree_tensor_ext.dispatch.workload.ordinal %15#2, 2 : index
        %19 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%16, %18}
        %20 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x8x1xf32>>{%17, %18}
        %21 = iree_tensor_ext.dispatch.tensor.load %19, offsets = [0, 0], sizes = [%16, %18], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%16, %18} -> tensor<?x?xf32>
        %22 = tensor.empty(%17, %18) : tensor<?x?x8x1xf32>
        %pack = linalg.pack %21 inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %22 : tensor<?x?xf32> -> tensor<?x?x8x1xf32>
        iree_tensor_ext.dispatch.tensor.store %pack, %20, offsets = [0, 0, 0, 0], sizes = [%17, %18, 8, 1], strides = [1, 1, 1, 1] : tensor<?x?x8x1xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x8x1xf32>>{%17, %18}
        return
      }
    }
  }
  util.func public @matmul_dynamic(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @matmul_dynamic(%input0: tensor<?x?xf32>) -> (%output0: tensor<?x?x8x1xf32>)"}} {
    %c32_i64 = arith.constant 32 : i64
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%0, %1]) type(%element_type_f32) encoding(%dense_row_major)
    %2 = arith.muli %0, %c4 : index
    %3 = arith.muli %2, %1 : index
    %4 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<?x?xf32>{%0, %1} in !stream.resource<external>{%3}
    %5 = arith.ceildivsi %0, %c8 : index
    %6 = arith.muli %5, %c32 : index
    %7 = arith.muli %6, %1 : index
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<external>{%7} => !stream.timepoint
    %8 = arith.index_castui %0 : index to i64
    %9 = arith.index_castui %0 : index to i32
    %10 = arith.shrui %8, %c32_i64 : i64
    %11 = arith.trunci %10 : i64 to i32
    %12 = arith.index_castui %5 : index to i64
    %13 = arith.index_castui %5 : index to i32
    %14 = arith.shrui %12, %c32_i64 : i64
    %15 = arith.trunci %14 : i64 to i32
    %16 = arith.index_castui %1 : index to i64
    %17 = arith.index_castui %1 : index to i32
    %18 = arith.shrui %16, %c32_i64 : i64
    %19 = arith.trunci %18 : i64 to i32
    %20 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%4 as %arg1: !stream.resource<external>{%3}, %result as %arg2: !stream.resource<external>{%7}) {
      stream.cmd.dispatch @matmul_dynamic_dispatch_0::@matmul_dynamic_dispatch_0_pack_f32[%0, %5, %1](%9, %11, %13, %15, %17, %19 : i32, i32, i32, i32, i32, i32) {
        ro %arg1[%c0 for %3] : !stream.resource<external>{%3},
        wo %arg2[%c0 for %7] : !stream.resource<external>{%7}
      }
    } => !stream.timepoint
    %21 = stream.timepoint.await %20 => %result : !stream.resource<external>{%7}
    %22 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %21 : tensor<?x?x8x1xf32>{%5, %1} in !stream.resource<external>{%7} -> !hal.buffer_view
    util.return %22 : !hal.buffer_view
  }
}
