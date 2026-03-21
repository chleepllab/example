#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  stream.executable private @conv_dynamic_dispatch_0 {
    stream.executable.export public @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32 workgroups(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11)
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32) {
        %c0 = arith.constant 0 : index
        %c32_i64 = arith.constant 32 : i64
        %0 = arith.extui %arg3 : i32 to i64
        %1 = arith.extui %arg4 : i32 to i64
        %2 = arith.shli %1, %c32_i64 : i64
        %3 = arith.ori %0, %2 : i64
        %4 = arith.index_castui %3 : i64 to index
        %5 = arith.extui %arg5 : i32 to i64
        %6 = arith.extui %arg6 : i32 to i64
        %7 = arith.shli %6, %c32_i64 : i64
        %8 = arith.ori %5, %7 : i64
        %9 = arith.index_castui %8 : i64 to index
        %10 = arith.extui %arg7 : i32 to i64
        %11 = arith.extui %arg8 : i32 to i64
        %12 = arith.shli %11, %c32_i64 : i64
        %13 = arith.ori %10, %12 : i64
        %14 = arith.index_castui %13 : i64 to index
        %15 = arith.extui %arg9 : i32 to i64
        %16 = arith.extui %arg10 : i32 to i64
        %17 = arith.shli %16, %c32_i64 : i64
        %18 = arith.ori %15, %17 : i64
        %19 = arith.index_castui %18 : i64 to index
        %20 = arith.extui %arg11 : i32 to i64
        %21 = arith.extui %arg12 : i32 to i64
        %22 = arith.shli %21, %c32_i64 : i64
        %23 = arith.ori %20, %22 : i64
        %24 = arith.index_castui %23 : i64 to index
        %25 = arith.extui %arg13 : i32 to i64
        %26 = arith.extui %arg14 : i32 to i64
        %27 = arith.shli %26, %c32_i64 : i64
        %28 = arith.ori %25, %27 : i64
        %29 = arith.index_castui %28 : i64 to index
        %30 = arith.extui %arg15 : i32 to i64
        %31 = arith.extui %arg16 : i32 to i64
        %32 = arith.shli %31, %c32_i64 : i64
        %33 = arith.ori %30, %32 : i64
        %34 = arith.index_castui %33 : i64 to index
        %35 = arith.extui %arg17 : i32 to i64
        %36 = arith.extui %arg18 : i32 to i64
        %37 = arith.shli %36, %c32_i64 : i64
        %38 = arith.ori %35, %37 : i64
        %39 = arith.index_castui %38 : i64 to index
        %40 = arith.extui %arg19 : i32 to i64
        %41 = arith.extui %arg20 : i32 to i64
        %42 = arith.shli %41, %c32_i64 : i64
        %43 = arith.ori %40, %42 : i64
        %44 = arith.index_castui %43 : i64 to index
        %45 = arith.extui %arg21 : i32 to i64
        %46 = arith.extui %arg22 : i32 to i64
        %47 = arith.shli %46, %c32_i64 : i64
        %48 = arith.ori %45, %47 : i64
        %49 = arith.index_castui %48 : i64 to index
        %50 = arith.extui %arg23 : i32 to i64
        %51 = arith.extui %arg24 : i32 to i64
        %52 = arith.shli %51, %c32_i64 : i64
        %53 = arith.ori %50, %52 : i64
        %54 = arith.index_castui %53 : i64 to index
        %55 = arith.extui %arg25 : i32 to i64
        %56 = arith.extui %arg26 : i32 to i64
        %57 = arith.shli %56, %c32_i64 : i64
        %58 = arith.ori %55, %57 : i64
        %59 = arith.index_castui %58 : i64 to index
        %60:12 = util.assume.int 
            %4<umin = 0, umax = 9007199254740991>, 
            %9<umin = 0, umax = 9007199254740991>, 
            %14<umin = 0, umax = 9007199254740991>, 
            %19<umin = 0, umax = 9007199254740991>, 
            %24<umin = 0, umax = 9007199254740991>, 
            %29<umin = 0, umax = 9007199254740991>, 
            %34<umin = 0, umax = 9007199254740991>, 
            %39<umin = 0, umax = 9007199254740991>, 
            %44<umin = 0, umax = 9007199254740991>, 
            %49<umin = 0, umax = 9007199254740991>, 
            %54<umin = 0, umax = 9007199254740991>, 
            %59<umin = 0, umax = 9007199254740991>
          : index, index, index, index, index, index, index, index, index, index, index, index
        %61 = iree_tensor_ext.dispatch.workload.ordinal %60#0, 0 : index
        %62 = iree_tensor_ext.dispatch.workload.ordinal %60#1, 1 : index
        %63 = iree_tensor_ext.dispatch.workload.ordinal %60#2, 2 : index
        %64 = iree_tensor_ext.dispatch.workload.ordinal %60#3, 3 : index
        %65 = iree_tensor_ext.dispatch.workload.ordinal %60#4, 4 : index
        %66 = iree_tensor_ext.dispatch.workload.ordinal %60#5, 5 : index
        %67 = iree_tensor_ext.dispatch.workload.ordinal %60#6, 6 : index
        %68 = iree_tensor_ext.dispatch.workload.ordinal %60#7, 7 : index
        %69 = iree_tensor_ext.dispatch.workload.ordinal %60#8, 8 : index
        %70 = iree_tensor_ext.dispatch.workload.ordinal %60#9, 9 : index
        %71 = iree_tensor_ext.dispatch.workload.ordinal %60#10, 10 : index
        %72 = iree_tensor_ext.dispatch.workload.ordinal %60#11, 11 : index
        %73 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%61, %62, %63, %64}
        %74 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%65, %66, %67, %68}
        %75 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%69, %70, %71, %72}
        %76 = iree_tensor_ext.dispatch.tensor.load %73, offsets = [0, 0, 0, 0], sizes = [%61, %62, %63, %64], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%61, %62, %63, %64} -> tensor<?x?x?x?xf32>
        %77 = iree_tensor_ext.dispatch.tensor.load %74, offsets = [0, 0, 0, 0], sizes = [%65, %66, %67, %68], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%65, %66, %67, %68} -> tensor<?x?x?x?xf32>
        %78 = iree_tensor_ext.dispatch.tensor.load %75, offsets = [0, 0, 0, 0], sizes = [%69, %70, %71, %72], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%69, %70, %71, %72} -> tensor<?x?x?x?xf32>
        %79 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%76, %77 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%78 : tensor<?x?x?x?xf32>) {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %80 = arith.mulf %in, %in_0 : f32
          %81 = arith.addf %out, %80 : f32
          linalg.yield %81 : f32
        } -> tensor<?x?x?x?xf32>
        iree_tensor_ext.dispatch.tensor.store %79, %75, offsets = [0, 0, 0, 0], sizes = [%69, %70, %71, %72], strides = [1, 1, 1, 1] : tensor<?x?x?x?xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%69, %70, %71, %72}
        return
      }
    }
  }
  util.func public @conv_dynamic(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @conv_dynamic(%input0: tensor<?x?x?x?xf32>, %input1: tensor<?x?x?x?xf32>, %input2: tensor<?x?x?x?xf32>) -> (%output0: tensor<?x?x?x?xf32>)"}} {
    %c32_i64 = arith.constant 32 : i64
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[2] : index
    %3 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[3] : index
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%0, %1, %2, %3]) type(%element_type_f32) encoding(%dense_row_major)
    %4 = arith.muli %0, %c4 : index
    %5 = arith.muli %4, %1 : index
    %6 = arith.muli %5, %2 : index
    %7 = arith.muli %6, %3 : index
    %8 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<?x?x?x?xf32>{%0, %1, %2, %3} in !stream.resource<external>{%7}
    %9 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[0] : index
    %10 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[1] : index
    %11 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[2] : index
    %12 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[3] : index
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("input1") shape([%9, %10, %11, %12]) type(%element_type_f32) encoding(%dense_row_major)
    %13 = arith.muli %9, %c4 : index
    %14 = arith.muli %13, %10 : index
    %15 = arith.muli %14, %11 : index
    %16 = arith.muli %15, %12 : index
    %17 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<?x?x?x?xf32>{%9, %10, %11, %12} in !stream.resource<external>{%16}
    %18 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[0] : index
    %19 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[1] : index
    %20 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[2] : index
    %21 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[3] : index
    hal.buffer_view.assert<%arg2 : !hal.buffer_view> message("input2") shape([%18, %19, %20, %21]) type(%element_type_f32) encoding(%dense_row_major)
    %22 = arith.muli %18, %c4 : index
    %23 = arith.muli %22, %19 : index
    %24 = arith.muli %23, %20 : index
    %25 = arith.muli %24, %21 : index
    %26 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg2 : !hal.buffer_view -> tensor<?x?x?x?xf32>{%18, %19, %20, %21} in !stream.resource<external>{%25}
    %27 = arith.index_castui %0 : index to i64
    %28 = arith.index_castui %0 : index to i32
    %29 = arith.shrui %27, %c32_i64 : i64
    %30 = arith.trunci %29 : i64 to i32
    %31 = arith.index_castui %1 : index to i64
    %32 = arith.index_castui %1 : index to i32
    %33 = arith.shrui %31, %c32_i64 : i64
    %34 = arith.trunci %33 : i64 to i32
    %35 = arith.index_castui %2 : index to i64
    %36 = arith.index_castui %2 : index to i32
    %37 = arith.shrui %35, %c32_i64 : i64
    %38 = arith.trunci %37 : i64 to i32
    %39 = arith.index_castui %3 : index to i64
    %40 = arith.index_castui %3 : index to i32
    %41 = arith.shrui %39, %c32_i64 : i64
    %42 = arith.trunci %41 : i64 to i32
    %43 = arith.index_castui %9 : index to i64
    %44 = arith.index_castui %9 : index to i32
    %45 = arith.shrui %43, %c32_i64 : i64
    %46 = arith.trunci %45 : i64 to i32
    %47 = arith.index_castui %10 : index to i64
    %48 = arith.index_castui %10 : index to i32
    %49 = arith.shrui %47, %c32_i64 : i64
    %50 = arith.trunci %49 : i64 to i32
    %51 = arith.index_castui %11 : index to i64
    %52 = arith.index_castui %11 : index to i32
    %53 = arith.shrui %51, %c32_i64 : i64
    %54 = arith.trunci %53 : i64 to i32
    %55 = arith.index_castui %12 : index to i64
    %56 = arith.index_castui %12 : index to i32
    %57 = arith.shrui %55, %c32_i64 : i64
    %58 = arith.trunci %57 : i64 to i32
    %59 = arith.index_castui %18 : index to i64
    %60 = arith.index_castui %18 : index to i32
    %61 = arith.shrui %59, %c32_i64 : i64
    %62 = arith.trunci %61 : i64 to i32
    %63 = arith.index_castui %19 : index to i64
    %64 = arith.index_castui %19 : index to i32
    %65 = arith.shrui %63, %c32_i64 : i64
    %66 = arith.trunci %65 : i64 to i32
    %67 = arith.index_castui %20 : index to i64
    %68 = arith.index_castui %20 : index to i32
    %69 = arith.shrui %67, %c32_i64 : i64
    %70 = arith.trunci %69 : i64 to i32
    %71 = arith.index_castui %21 : index to i64
    %72 = arith.index_castui %21 : index to i32
    %73 = arith.shrui %71, %c32_i64 : i64
    %74 = arith.trunci %73 : i64 to i32
    %75 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) with(%8 as %arg3: !stream.resource<external>{%7}, %17 as %arg4: !stream.resource<external>{%16}, %26 as %arg5: !stream.resource<external>{%25}) {
      stream.cmd.dispatch @conv_dynamic_dispatch_0::@conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32[%0, %1, %2, %3, %9, %10, %11, %12, %18, %19, %20, %21](%28, %30, %32, %34, %36, %38, %40, %42, %44, %46, %48, %50, %52, %54, %56, %58, %60, %62, %64, %66, %68, %70, %72, %74 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) {
        ro %arg3[%c0 for %7] : !stream.resource<external>{%7},
        ro %arg4[%c0 for %16] : !stream.resource<external>{%16},
        rw %arg5[%c0 for %25] : !stream.resource<external>{%25}
      }
    } => !stream.timepoint
    %76 = stream.timepoint.await %75 => %26 : !stream.resource<external>{%25}
    %77 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %76 : tensor<?x?x?x?xf32>{%18, %19, %20, %21} in !stream.resource<external>{%25} -> !hal.buffer_view
    util.return %77 : !hal.buffer_view
  }
}
