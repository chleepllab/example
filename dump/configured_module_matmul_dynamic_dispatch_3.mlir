hal.executable public @matmul_dynamic_dispatch_3 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
    hal.executable.export public @matmul_dynamic_dispatch_3_mmt4d_DxDxDx7x32x1_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3, %arg4, %arg5, %arg6
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_3_mmt4d_DxDxDx7x32x1_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = Mmt4dTilingExpert>} {
        %c32_i64 = arith.constant 32 : i64
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(6) : i32
        %7 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(7) : i32
        %8 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(8) : i32
        %9 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(9) : i32
        %10 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(10) : i32
        %11 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(11) : i32
        %12 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(12) : i32
        %13 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(13) : i32
        %14 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(14) : i32
        %15 = hal.interface.constant.load layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(15) : i32
        %16 = arith.extui %0 : i32 to i64
        %17 = arith.extui %1 : i32 to i64
        %18 = arith.shli %17, %c32_i64 : i64
        %19 = arith.ori %16, %18 : i64
        %20 = arith.index_castui %19 {stream.alignment = 64 : index} : i64 to index
        %21 = arith.extui %2 : i32 to i64
        %22 = arith.extui %3 : i32 to i64
        %23 = arith.shli %22, %c32_i64 : i64
        %24 = arith.ori %21, %23 : i64
        %25 = arith.index_castui %24 : i64 to index
        %26 = arith.extui %4 : i32 to i64
        %27 = arith.extui %5 : i32 to i64
        %28 = arith.shli %27, %c32_i64 : i64
        %29 = arith.ori %26, %28 : i64
        %30 = arith.index_castui %29 : i64 to index
        %31 = arith.extui %6 : i32 to i64
        %32 = arith.extui %7 : i32 to i64
        %33 = arith.shli %32, %c32_i64 : i64
        %34 = arith.ori %31, %33 : i64
        %35 = arith.index_castui %34 : i64 to index
        %36 = arith.extui %8 : i32 to i64
        %37 = arith.extui %9 : i32 to i64
        %38 = arith.shli %37, %c32_i64 : i64
        %39 = arith.ori %36, %38 : i64
        %40 = arith.index_castui %39 : i64 to index
        %41 = arith.extui %10 : i32 to i64
        %42 = arith.extui %11 : i32 to i64
        %43 = arith.shli %42, %c32_i64 : i64
        %44 = arith.ori %41, %43 : i64
        %45 = arith.index_castui %44 : i64 to index
        %46 = arith.extui %12 : i32 to i64
        %47 = arith.extui %13 : i32 to i64
        %48 = arith.shli %47, %c32_i64 : i64
        %49 = arith.ori %46, %48 : i64
        %50 = arith.index_castui %49 : i64 to index
        %51 = arith.extui %14 : i32 to i64
        %52 = arith.extui %15 : i32 to i64
        %53 = arith.shli %52, %c32_i64 : i64
        %54 = arith.ori %51, %53 : i64
        %55 = arith.index_castui %54 : i64 to index
        %56:3 = util.assume.int 
            %20<udiv = 64>, 
            %35<umin = 0, umax = 9007199254740991>, 
            %45<umin = 0, umax = 9007199254740991>
          : index, index, index
        %57 = iree_tensor_ext.dispatch.workload.ordinal %30, 0 : index
        %58 = iree_tensor_ext.dispatch.workload.ordinal %56#1, 1 : index
        %59 = iree_tensor_ext.dispatch.workload.ordinal %40, 2 : index
        %60 = iree_tensor_ext.dispatch.workload.ordinal %56#2, 3 : index
        %61 = iree_tensor_ext.dispatch.workload.ordinal %50, 4 : index
        %62 = iree_tensor_ext.dispatch.workload.ordinal %55, 5 : index
        %63 = hal.interface.binding.subspan layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x7x1xf32>>{%57, %58}
        %64 = hal.interface.binding.subspan layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%56#0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x32x1xf32>>{%59, %60}
        %65 = hal.interface.binding.subspan layout(<constants = 16, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%25) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x7x32xf32>>{%61, %62}
        %66 = iree_tensor_ext.dispatch.tensor.load %63, offsets = [0, 0, 0, 0], sizes = [%57, %58, 7, 1], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x7x1xf32>>{%57, %58} -> tensor<?x?x7x1xf32>
        %67 = iree_tensor_ext.dispatch.tensor.load %64, offsets = [0, 0, 0, 0], sizes = [%59, %60, 32, 1], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x32x1xf32>>{%59, %60} -> tensor<?x?x32x1xf32>
        %68 = iree_tensor_ext.dispatch.tensor.load %65, offsets = [0, 0, 0, 0], sizes = [%61, %62, 7, 32], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x7x32xf32>>{%61, %62} -> tensor<?x?x7x32xf32>
        %69 = linalg.mmt4d {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[3, 1, 0, 0, 0, 0], [1, 1, 0, 7, 32, 0], [0, 0, 1, 0, 0, 1]]>} ins(%66, %67 : tensor<?x?x7x1xf32>, tensor<?x?x32x1xf32>) outs(%68 : tensor<?x?x7x32xf32>) -> tensor<?x?x7x32xf32>
        iree_tensor_ext.dispatch.tensor.store %69, %65, offsets = [0, 0, 0, 0], sizes = [%61, %62, 7, 32], strides = [1, 1, 1, 1] : tensor<?x?x7x32xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?x7x32xf32>>{%61, %62}
        return
      }
    }
  }
}
