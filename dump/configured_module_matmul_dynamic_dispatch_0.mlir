hal.executable public @matmul_dynamic_dispatch_0 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
    hal.executable.export public @matmul_dynamic_dispatch_0_pack_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @matmul_dynamic_dispatch_0_pack_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDataTiling>} {
        %c32_i64 = arith.constant 32 : i64
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = arith.extui %0 : i32 to i64
        %7 = arith.extui %1 : i32 to i64
        %8 = arith.shli %7, %c32_i64 : i64
        %9 = arith.ori %6, %8 : i64
        %10 = arith.index_castui %9 : i64 to index
        %11 = arith.extui %2 : i32 to i64
        %12 = arith.extui %3 : i32 to i64
        %13 = arith.shli %12, %c32_i64 : i64
        %14 = arith.ori %11, %13 : i64
        %15 = arith.index_castui %14 : i64 to index
        %16 = arith.extui %4 : i32 to i64
        %17 = arith.extui %5 : i32 to i64
        %18 = arith.shli %17, %c32_i64 : i64
        %19 = arith.ori %16, %18 : i64
        %20 = arith.index_castui %19 : i64 to index
        %21:2 = util.assume.int 
            %10<umin = 0, umax = 9007199254740991>, 
            %20<umin = 0, umax = 9007199254740991>
          : index, index
        %22 = iree_tensor_ext.dispatch.workload.ordinal %21#0, 0 : index
        %23 = iree_tensor_ext.dispatch.workload.ordinal %15, 1 : index
        %24 = iree_tensor_ext.dispatch.workload.ordinal %21#1, 2 : index
        %25 = hal.interface.binding.subspan layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%22, %24}
        %26 = hal.interface.binding.subspan layout(<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x7x1xf32>>{%23, %24}
        %27 = iree_tensor_ext.dispatch.tensor.load %25, offsets = [0, 0], sizes = [%22, %24], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?x?xf32>>{%22, %24} -> tensor<?x?xf32>
        %28 = tensor.empty(%23, %24) : tensor<?x?x7x1xf32>
        %pack = linalg.pack %27 padding_value(%cst : f32) outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [7, 1] into %28 {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[9, 64], [1, 1]]>} : tensor<?x?xf32> -> tensor<?x?x7x1xf32>
        iree_tensor_ext.dispatch.tensor.store %pack, %26, offsets = [0, 0, 0, 0], sizes = [%23, %24, 7, 1], strides = [1, 1, 1, 1] : tensor<?x?x7x1xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?x?x7x1xf32>>{%23, %24}
        return
      }
    }
  }
}
