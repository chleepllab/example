#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#pipeline_layout = #hal.pipeline.layout<constants = 24, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  hal.executable private @conv_dynamic_dispatch_0 {
    hal.executable.variant public @embedded_elf_riscv_64 target(#executable_target_embedded_elf_riscv_64) {
      hal.executable.export public @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32 ordinal(0) layout(#pipeline_layout) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice(%arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12)
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32() {
          %c32_i64 = arith.constant 32 : i64
          %c0 = arith.constant 0 : index
          %0 = hal.interface.constant.load layout(#pipeline_layout) ordinal(0) : i32
          %1 = hal.interface.constant.load layout(#pipeline_layout) ordinal(1) : i32
          %2 = hal.interface.constant.load layout(#pipeline_layout) ordinal(2) : i32
          %3 = hal.interface.constant.load layout(#pipeline_layout) ordinal(3) : i32
          %4 = hal.interface.constant.load layout(#pipeline_layout) ordinal(4) : i32
          %5 = hal.interface.constant.load layout(#pipeline_layout) ordinal(5) : i32
          %6 = hal.interface.constant.load layout(#pipeline_layout) ordinal(6) : i32
          %7 = hal.interface.constant.load layout(#pipeline_layout) ordinal(7) : i32
          %8 = hal.interface.constant.load layout(#pipeline_layout) ordinal(8) : i32
          %9 = hal.interface.constant.load layout(#pipeline_layout) ordinal(9) : i32
          %10 = hal.interface.constant.load layout(#pipeline_layout) ordinal(10) : i32
          %11 = hal.interface.constant.load layout(#pipeline_layout) ordinal(11) : i32
          %12 = hal.interface.constant.load layout(#pipeline_layout) ordinal(12) : i32
          %13 = hal.interface.constant.load layout(#pipeline_layout) ordinal(13) : i32
          %14 = hal.interface.constant.load layout(#pipeline_layout) ordinal(14) : i32
          %15 = hal.interface.constant.load layout(#pipeline_layout) ordinal(15) : i32
          %16 = hal.interface.constant.load layout(#pipeline_layout) ordinal(16) : i32
          %17 = hal.interface.constant.load layout(#pipeline_layout) ordinal(17) : i32
          %18 = hal.interface.constant.load layout(#pipeline_layout) ordinal(18) : i32
          %19 = hal.interface.constant.load layout(#pipeline_layout) ordinal(19) : i32
          %20 = hal.interface.constant.load layout(#pipeline_layout) ordinal(20) : i32
          %21 = hal.interface.constant.load layout(#pipeline_layout) ordinal(21) : i32
          %22 = hal.interface.constant.load layout(#pipeline_layout) ordinal(22) : i32
          %23 = hal.interface.constant.load layout(#pipeline_layout) ordinal(23) : i32
          %24 = arith.extui %0 : i32 to i64
          %25 = arith.extui %1 : i32 to i64
          %26 = arith.shli %25, %c32_i64 : i64
          %27 = arith.ori %24, %26 : i64
          %28 = arith.index_castui %27 : i64 to index
          %29 = arith.extui %2 : i32 to i64
          %30 = arith.extui %3 : i32 to i64
          %31 = arith.shli %30, %c32_i64 : i64
          %32 = arith.ori %29, %31 : i64
          %33 = arith.index_castui %32 : i64 to index
          %34 = arith.extui %4 : i32 to i64
          %35 = arith.extui %5 : i32 to i64
          %36 = arith.shli %35, %c32_i64 : i64
          %37 = arith.ori %34, %36 : i64
          %38 = arith.index_castui %37 : i64 to index
          %39 = arith.extui %6 : i32 to i64
          %40 = arith.extui %7 : i32 to i64
          %41 = arith.shli %40, %c32_i64 : i64
          %42 = arith.ori %39, %41 : i64
          %43 = arith.index_castui %42 : i64 to index
          %44 = arith.extui %8 : i32 to i64
          %45 = arith.extui %9 : i32 to i64
          %46 = arith.shli %45, %c32_i64 : i64
          %47 = arith.ori %44, %46 : i64
          %48 = arith.index_castui %47 : i64 to index
          %49 = arith.extui %10 : i32 to i64
          %50 = arith.extui %11 : i32 to i64
          %51 = arith.shli %50, %c32_i64 : i64
          %52 = arith.ori %49, %51 : i64
          %53 = arith.index_castui %52 : i64 to index
          %54 = arith.extui %12 : i32 to i64
          %55 = arith.extui %13 : i32 to i64
          %56 = arith.shli %55, %c32_i64 : i64
          %57 = arith.ori %54, %56 : i64
          %58 = arith.index_castui %57 : i64 to index
          %59 = arith.extui %14 : i32 to i64
          %60 = arith.extui %15 : i32 to i64
          %61 = arith.shli %60, %c32_i64 : i64
          %62 = arith.ori %59, %61 : i64
          %63 = arith.index_castui %62 : i64 to index
          %64 = arith.extui %16 : i32 to i64
          %65 = arith.extui %17 : i32 to i64
          %66 = arith.shli %65, %c32_i64 : i64
          %67 = arith.ori %64, %66 : i64
          %68 = arith.index_castui %67 : i64 to index
          %69 = arith.extui %18 : i32 to i64
          %70 = arith.extui %19 : i32 to i64
          %71 = arith.shli %70, %c32_i64 : i64
          %72 = arith.ori %69, %71 : i64
          %73 = arith.index_castui %72 : i64 to index
          %74 = arith.extui %20 : i32 to i64
          %75 = arith.extui %21 : i32 to i64
          %76 = arith.shli %75, %c32_i64 : i64
          %77 = arith.ori %74, %76 : i64
          %78 = arith.index_castui %77 : i64 to index
          %79 = arith.extui %22 : i32 to i64
          %80 = arith.extui %23 : i32 to i64
          %81 = arith.shli %80, %c32_i64 : i64
          %82 = arith.ori %79, %81 : i64
          %83 = arith.index_castui %82 : i64 to index
          %84:12 = util.assume.int 
              %28<umin = 0, umax = 9007199254740991>, 
              %33<umin = 0, umax = 9007199254740991>, 
              %38<umin = 0, umax = 9007199254740991>, 
              %43<umin = 0, umax = 9007199254740991>, 
              %48<umin = 0, umax = 9007199254740991>, 
              %53<umin = 0, umax = 9007199254740991>, 
              %58<umin = 0, umax = 9007199254740991>, 
              %63<umin = 0, umax = 9007199254740991>, 
              %68<umin = 0, umax = 9007199254740991>, 
              %73<umin = 0, umax = 9007199254740991>, 
              %78<umin = 0, umax = 9007199254740991>, 
              %83<umin = 0, umax = 9007199254740991>
            : index, index, index, index, index, index, index, index, index, index, index, index
          %85 = iree_tensor_ext.dispatch.workload.ordinal %84#0, 0 : index
          %86 = iree_tensor_ext.dispatch.workload.ordinal %84#1, 1 : index
          %87 = iree_tensor_ext.dispatch.workload.ordinal %84#2, 2 : index
          %88 = iree_tensor_ext.dispatch.workload.ordinal %84#3, 3 : index
          %89 = iree_tensor_ext.dispatch.workload.ordinal %84#4, 4 : index
          %90 = iree_tensor_ext.dispatch.workload.ordinal %84#5, 5 : index
          %91 = iree_tensor_ext.dispatch.workload.ordinal %84#6, 6 : index
          %92 = iree_tensor_ext.dispatch.workload.ordinal %84#7, 7 : index
          %93 = iree_tensor_ext.dispatch.workload.ordinal %84#8, 8 : index
          %94 = iree_tensor_ext.dispatch.workload.ordinal %84#9, 9 : index
          %95 = iree_tensor_ext.dispatch.workload.ordinal %84#10, 10 : index
          %96 = iree_tensor_ext.dispatch.workload.ordinal %84#11, 11 : index
          %97 = hal.interface.binding.subspan layout(#pipeline_layout) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%85, %86, %87, %88}
          %98 = hal.interface.binding.subspan layout(#pipeline_layout) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%89, %90, %91, %92}
          %99 = hal.interface.binding.subspan layout(#pipeline_layout) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%93, %94, %95, %96}
          %100 = iree_tensor_ext.dispatch.tensor.load %97, offsets = [0, 0, 0, 0], sizes = [%85, %86, %87, %88], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%85, %86, %87, %88} -> tensor<?x?x?x?xf32>
          %101 = iree_tensor_ext.dispatch.tensor.load %98, offsets = [0, 0, 0, 0], sizes = [%89, %90, %91, %92], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x?x?xf32>>{%89, %90, %91, %92} -> tensor<?x?x?x?xf32>
          %102 = iree_tensor_ext.dispatch.tensor.load %99, offsets = [0, 0, 0, 0], sizes = [%93, %94, %95, %96], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%93, %94, %95, %96} -> tensor<?x?x?x?xf32>
          %103 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%100, %101 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%102 : tensor<?x?x?x?xf32>) {
          ^bb0(%in: f32, %in_0: f32, %out: f32):
            %104 = arith.mulf %in, %in_0 : f32
            %105 = arith.addf %out, %104 : f32
            linalg.yield %105 : f32
          } -> tensor<?x?x?x?xf32>
          iree_tensor_ext.dispatch.tensor.store %103, %99, offsets = [0, 0, 0, 0], sizes = [%93, %94, %95, %96], strides = [1, 1, 1, 1] : tensor<?x?x?x?xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x?x?xf32>>{%93, %94, %95, %96}
          return
        }
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
      stream.cmd.dispatch @conv_dynamic_dispatch_0::@embedded_elf_riscv_64::@conv_dynamic_dispatch_0_conv_DxDxDxDxDxDxD_f32[%0, %1, %2, %3, %9, %10, %11, %12, %18, %19, %20, %21](%28, %30, %32, %34, %36, %38, %40, %42, %44, %46, %48, %50, %52, %54, %56, %58, %60, %62, %64, %66, %68, %70, %72, %74 : i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) {
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
