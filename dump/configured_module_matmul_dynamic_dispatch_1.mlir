hal.executable public @matmul_dynamic_dispatch_1 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
    hal.executable.export public @matmul_dynamic_dispatch_1_pack_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_1_pack_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDataTiling>} {
        %c32_i64 = arith.constant 32 : i64
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(6) : i32
        %7 = hal.interface.constant.load layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(7) : i32
        %8 = arith.extui %0 : i32 to i64
        %9 = arith.extui %1 : i32 to i64
        %10 = arith.shli %9, %c32_i64 : i64
        %11 = arith.ori %8, %10 : i64
        %12 = arith.index_castui %11 {stream.alignment = 64 : index} : i64 to index
        %13 = arith.extui %2 : i32 to i64
        %14 = arith.extui %3 : i32 to i64
        %15 = arith.shli %14, %c32_i64 : i64
        %16 = arith.ori %13, %15 : i64
        %17 = arith.index_castui %16 : i64 to index
        %18 = arith.extui %4 : i32 to i64
        %19 = arith.extui %5 : i32 to i64
        %20 = arith.shli %19, %c32_i64 : i64
        %21 = arith.ori %18, %20 : i64
        %22 = arith.index_castui %21 : i64 to index
        %23 = arith.extui %6 : i32 to i64
        %24 = arith.extui %7 : i32 to i64
        %25 = arith.shli %24, %c32_i64 : i64
        %26 = arith.ori %23, %25 : i64
        %27 = arith.index_castui %26 : i64 to index
        %28:3 = util.assume.int 
            %12<udiv = 64>, 
            %17<umin = 0, umax = 9007199254740991>, 
            %27<umin = 0, umax = 9007199254740991>
          : index, index, index
        %29 = iree_tensor_ext.dispatch.workload.ordinal %28#1, 0 : index
        %30 = iree_tensor_ext.dispatch.workload.ordinal %22, 1 : index
        %31 = iree_tensor_ext.dispatch.workload.ordinal %28#2, 2 : index
        %32 = hal.interface.binding.subspan layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%31, %29}
        %33 = hal.interface.binding.subspan layout(<constants = 8, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%28#0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x32x1xf32>>{%30, %31}
        %34 = iree_tensor_ext.dispatch.tensor.load %32, offsets = [0, 0], sizes = [%31, %29], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%31, %29} -> tensor<?x?xf32>
        %35 = tensor.empty(%30, %31) : tensor<?x?x32x1xf32>
        %pack = linalg.pack %34 padding_value(%cst : f32) outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [32, 1] into %35 {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[64, 2], [1, 1]]>} : tensor<?x?xf32> -> tensor<?x?x32x1xf32>
        iree_tensor_ext.dispatch.tensor.store %pack, %33, offsets = [0, 0, 0, 0], sizes = [%30, %31, 32, 1], strides = [1, 1, 1, 1] : tensor<?x?x32x1xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x32x1xf32>>{%30, %31}
        return
      }
    }
  }
}
