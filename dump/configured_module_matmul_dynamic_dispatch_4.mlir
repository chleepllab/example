hal.executable public @matmul_dynamic_dispatch_4 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
    hal.executable.export public @matmul_dynamic_dispatch_4_unpack_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3, %arg4
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_4_unpack_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDataTiling>} {
        %c32_i64 = arith.constant 32 : i64
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(6) : i32
        %7 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(7) : i32
        %8 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(8) : i32
        %9 = hal.interface.constant.load layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(9) : i32
        %10 = arith.extui %0 : i32 to i64
        %11 = arith.extui %1 : i32 to i64
        %12 = arith.shli %11, %c32_i64 : i64
        %13 = arith.ori %10, %12 : i64
        %14 = arith.index_castui %13 : i64 to index
        %15 = arith.extui %2 : i32 to i64
        %16 = arith.extui %3 : i32 to i64
        %17 = arith.shli %16, %c32_i64 : i64
        %18 = arith.ori %15, %17 : i64
        %19 = arith.index_castui %18 : i64 to index
        %20 = arith.extui %4 : i32 to i64
        %21 = arith.extui %5 : i32 to i64
        %22 = arith.shli %21, %c32_i64 : i64
        %23 = arith.ori %20, %22 : i64
        %24 = arith.index_castui %23 : i64 to index
        %25 = arith.extui %6 : i32 to i64
        %26 = arith.extui %7 : i32 to i64
        %27 = arith.shli %26, %c32_i64 : i64
        %28 = arith.ori %25, %27 : i64
        %29 = arith.index_castui %28 : i64 to index
        %30 = arith.extui %8 : i32 to i64
        %31 = arith.extui %9 : i32 to i64
        %32 = arith.shli %31, %c32_i64 : i64
        %33 = arith.ori %30, %32 : i64
        %34 = arith.index_castui %33 : i64 to index
        %35:2 = util.assume.int 
            %29<umin = 0, umax = 9007199254740991>, 
            %34<umin = 0, umax = 9007199254740991>
          : index, index
        %36 = iree_tensor_ext.dispatch.workload.ordinal %19, 0 : index
        %37 = iree_tensor_ext.dispatch.workload.ordinal %24, 1 : index
        %38 = iree_tensor_ext.dispatch.workload.ordinal %35#0, 2 : index
        %39 = iree_tensor_ext.dispatch.workload.ordinal %35#1, 3 : index
        %40 = hal.interface.binding.subspan layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%14) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x7x32xf32>>{%36, %37}
        %41 = hal.interface.binding.subspan layout(<constants = 10, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?xf32>>{%38, %39}
        %42 = iree_tensor_ext.dispatch.tensor.load %40, offsets = [0, 0, 0, 0], sizes = [%36, %37, 7, 32], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?x7x32xf32>>{%36, %37} -> tensor<?x?x7x32xf32>
        %43 = tensor.empty(%38, %39) : tensor<?x?xf32>
        %unpack = linalg.unpack %42 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [7, 32] into %43 {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[70, 64], [7, 32]]>} : tensor<?x?x7x32xf32> -> tensor<?x?xf32>
        iree_tensor_ext.dispatch.tensor.store %unpack, %41, offsets = [0, 0], sizes = [%38, %39], strides = [1, 1] : tensor<?x?xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?xf32>>{%38, %39}
        return
      }
    }
  }
}
