hal.executable public @conv_dynamic_dispatch_0 {
  hal.executable.variant public @embedded_elf_riscv_64 target(<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_layout<>, loop_vectorization = true, max_stack_allocation_size = 32768 : i64, native_vector_size = 256 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf"}>) {
    hal.executable.export public @conv_dynamic_dispatch_0_conv_2d_nchw_fchw_1x64x31x31x3x3x3_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @conv_dynamic_dispatch_0_conv_2d_nchw_fchw_1x64x31x31x3x3x3_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUConvTileAndDecomposeExpert>} {
        %c0 = arith.constant 0 : index
        %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x3x64x64xf32>>
        %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x3x3x3xf32>>
        %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<1x64x31x31xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0, 0], sizes = [1, 3, 64, 64], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x3x64x64xf32>> -> tensor<1x3x64x64xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0, 0], sizes = [64, 3, 3, 3], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x3x3x3xf32>> -> tensor<64x3x3x3xf32>
        %5 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0, 0, 0], sizes = [1, 64, 31, 31], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readwrite:tensor<1x64x31x31xf32>> -> tensor<1x64x31x31xf32>
        %6 = linalg.conv_2d_nchw_fchw {lowering_config = #iree_codegen.lowering_config<tile_sizes = [[0, 8, 1, 31, 0, 0, 0], [1, [8], 1, 1, 0, 0, 0], [0, 0, 0, 0, 3, 1, 1], [0, 0, 0, 0, 0, 0, 0]]>} ins(%3, %4 : tensor<1x3x64x64xf32>, tensor<64x3x3x3xf32>) outs(%5 : tensor<1x64x31x31xf32>) -> tensor<1x64x31x31xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0, 0, 0, 0], sizes = [1, 64, 31, 31], strides = [1, 1, 1, 1] : tensor<1x64x31x31xf32> -> !iree_tensor_ext.dispatch.tensor<readwrite:tensor<1x64x31x31xf32>>
        return
      }
    }
  }
}
