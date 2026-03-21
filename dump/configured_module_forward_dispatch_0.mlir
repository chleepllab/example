hal.executable public @forward_dispatch_0 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, loop_vectorization = true, max_stack_allocation_size = 32768 : i64, native_vector_size = 256 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf"}>) {
    hal.executable.export public @forward_dispatch_0_elementwise_D_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice %arg1, %arg2, %arg3
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @forward_dispatch_0_elementwise_D_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
        %c32_i64 = arith.constant 32 : i64
        %c0 = arith.constant 0 : index
        %0 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
        %1 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
        %2 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(2) : i32
        %3 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(3) : i32
        %4 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(4) : i32
        %5 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(5) : i32
        %6 = hal.interface.constant.load layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(6) : i32
        %7 = arith.bitcast %0 : i32 to f32
        %8 = arith.extui %1 : i32 to i64
        %9 = arith.extui %2 : i32 to i64
        %10 = arith.shli %9, %c32_i64 : i64
        %11 = arith.ori %8, %10 : i64
        %12 = arith.index_castui %11 : i64 to index
        %13 = arith.extui %3 : i32 to i64
        %14 = arith.extui %4 : i32 to i64
        %15 = arith.shli %14, %c32_i64 : i64
        %16 = arith.ori %13, %15 : i64
        %17 = arith.index_castui %16 : i64 to index
        %18 = arith.extui %5 : i32 to i64
        %19 = arith.extui %6 : i32 to i64
        %20 = arith.shli %19, %c32_i64 : i64
        %21 = arith.ori %18, %20 : i64
        %22 = arith.index_castui %21 : i64 to index
        %23:3 = util.assume.int 
            %12<umin = 0, umax = 9007199254740991>, 
            %17<umin = 0, umax = 9007199254740991>, 
            %22<umin = 0, umax = 9007199254740991>
          : index, index, index
        %24 = iree_tensor_ext.dispatch.workload.ordinal %23#0, 0 : index
        %25 = iree_tensor_ext.dispatch.workload.ordinal %23#1, 1 : index
        %26 = iree_tensor_ext.dispatch.workload.ordinal %23#2, 2 : index
        %27 = hal.interface.binding.subspan layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?xf32>>{%24}
        %28 = hal.interface.binding.subspan layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?xf32>>{%25}
        %29 = hal.interface.binding.subspan layout(<constants = 7, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?xf32>>{%26}
        %30 = iree_tensor_ext.dispatch.tensor.load %27, offsets = [0], sizes = [%24], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?xf32>>{%24} -> tensor<?xf32>
        %31 = iree_tensor_ext.dispatch.tensor.load %28, offsets = [0], sizes = [%25], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<?xf32>>{%25} -> tensor<?xf32>
        %32 = tensor.empty(%26) : tensor<?xf32>
        %33 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%30, %31 : tensor<?xf32>, tensor<?xf32>) outs(%32 : tensor<?xf32>) attrs =  {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[64], [64], [0], [0]]>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %34 = arith.addf %in, %in_0 : f32
          %35 = arith.mulf %7, %34 : f32
          linalg.yield %35 : f32
        } -> tensor<?xf32>
        iree_tensor_ext.dispatch.tensor.store %33, %29, offsets = [0], sizes = [%26], strides = [1] : tensor<?xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<?xf32>>{%26}
        return
      }
    }
  }
}
