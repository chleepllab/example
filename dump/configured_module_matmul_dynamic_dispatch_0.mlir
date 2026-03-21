hal.executable public @matmul_dynamic_dispatch_0 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf"}>) {
    hal.executable.export public @matmul_dynamic_dispatch_0_matmul_DxDxD_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3, %arg4, %arg5, %arg6
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_0_matmul_DxDxD_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert, {enable_loop_peeling}>} {
        %c32_i64 = arith.constant 32 : i64
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(6) : i32
        %7 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(7) : i32
        %8 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(8) : i32
        %9 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(9) : i32
        %10 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(10) : i32
        %11 = hal.interface.constant.load layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(11) : i32
        %12 = arith.extui %0 : i32 to i64
        %13 = arith.extui %1 : i32 to i64
        %14 = arith.shli %13, %c32_i64 : i64
        %15 = arith.ori %12, %14 : i64
        %16 = arith.index_castui %15 : i64 to index
        %17 = arith.extui %2 : i32 to i64
        %18 = arith.extui %3 : i32 to i64
        %19 = arith.shli %18, %c32_i64 : i64
        %20 = arith.ori %17, %19 : i64
        %21 = arith.index_castui %20 : i64 to index
        %22 = arith.extui %4 : i32 to i64
        %23 = arith.extui %5 : i32 to i64
        %24 = arith.shli %23, %c32_i64 : i64
        %25 = arith.ori %22, %24 : i64
        %26 = arith.index_castui %25 : i64 to index
        %27 = arith.extui %6 : i32 to i64
        %28 = arith.extui %7 : i32 to i64
        %29 = arith.shli %28, %c32_i64 : i64
        %30 = arith.ori %27, %29 : i64
        %31 = arith.index_castui %30 : i64 to index
        %32 = arith.extui %8 : i32 to i64
        %33 = arith.extui %9 : i32 to i64
        %34 = arith.shli %33, %c32_i64 : i64
        %35 = arith.ori %32, %34 : i64
        %36 = arith.index_castui %35 : i64 to index
        %37 = arith.extui %10 : i32 to i64
        %38 = arith.extui %11 : i32 to i64
        %39 = arith.shli %38, %c32_i64 : i64
        %40 = arith.ori %37, %39 : i64
        %41 = arith.index_castui %40 : i64 to index
        %42:6 = util.assume.int 
            %16<umin = 0, umax = 9007199254740991>, 
            %21<umin = 0, umax = 9007199254740991>, 
            %26<umin = 0, umax = 9007199254740991>, 
            %31<umin = 0, umax = 9007199254740991>, 
            %36<umin = 0, umax = 9007199254740991>, 
            %41<umin = 0, umax = 9007199254740991>
          : index, index, index, index, index, index
        %43 = iree_tensor_ext.dispatch.workload.ordinal %42#0, 0 : index
        %44 = iree_tensor_ext.dispatch.workload.ordinal %42#1, 1 : index
        %45 = iree_tensor_ext.dispatch.workload.ordinal %42#2, 2 : index
        %46 = iree_tensor_ext.dispatch.workload.ordinal %42#3, 3 : index
        %47 = iree_tensor_ext.dispatch.workload.ordinal %42#4, 4 : index
        %48 = iree_tensor_ext.dispatch.workload.ordinal %42#5, 5 : index
        %49 = hal.interface.binding.subspan layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%43, %44}
        %50 = hal.interface.binding.subspan layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%45, %46}
        %51 = hal.interface.binding.subspan layout(<constants = 12, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?xf32>>{%47, %48}
        %52 = iree_tensor_ext.dispatch.tensor.load %49, offsets = [0, 0], sizes = [%43, %44], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%43, %44} -> tensor<?x?xf32>
        %53 = iree_tensor_ext.dispatch.tensor.load %50, offsets = [0, 0], sizes = [%45, %46], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%45, %46} -> tensor<?x?xf32>
        %54 = iree_tensor_ext.dispatch.tensor.load %51, offsets = [0, 0], sizes = [%47, %48], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?xf32>>{%47, %48} -> tensor<?x?xf32>
        %55 = linalg.matmul {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[64, 64, 0], [64, 64, 0], [0, 0, 0], [8, 16, 0], [0, 0, 1], [0, 0, 0]]>} ins(%52, %53 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%54 : tensor<?x?xf32>) -> tensor<?x?xf32>
        iree_tensor_ext.dispatch.tensor.store %55, %51, offsets = [0, 0], sizes = [%47, %48], strides = [1, 1] : tensor<?x?xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<?x?xf32>>{%47, %48}
        return
      }
    }
  }
}
