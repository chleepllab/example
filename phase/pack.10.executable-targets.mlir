#executable_target_embedded_elf_riscv_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-riscv_64", {cpu = "", cpu_features = "+m,+a,+f,+d,+zvl256b,+v", data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_abi = "lp64d", target_triple = "riscv64-unknown-unknown-eabi-elf", ukernels = "all"}>
#pipeline_layout = #hal.pipeline.layout<constants = 6, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_riscv_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #device_target_local
  hal.executable private @matmul_dynamic_dispatch_0 {
    hal.executable.variant public @embedded_elf_riscv_64 target(#executable_target_embedded_elf_riscv_64) {
      hal.executable.export public @matmul_dynamic_dispatch_0_pack_f32 ordinal(0) layout(#pipeline_layout) count(%arg0: !hal.device, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
        %c8 = arith.constant 8 : index
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %0 = arith.cmpi sle, %arg2, %c0 : index
        %1 = arith.subi %c0, %arg2 : index
        %2 = arith.subi %arg2, %c1 : index
        %3 = arith.select %0, %1, %2 : index
        %4 = arith.divsi %3, %c8 : index
        %5 = arith.subi %c0, %4 : index
        %6 = arith.addi %4, %c1 : index
        %7 = arith.select %0, %5, %6 : index
        %c64 = arith.constant 64 : index
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %8 = arith.cmpi sle, %arg3, %c0_0 : index
        %9 = arith.subi %c0_0, %arg3 : index
        %10 = arith.subi %arg3, %c1_1 : index
        %11 = arith.select %8, %9, %10 : index
        %12 = arith.divsi %11, %c64 : index
        %13 = arith.subi %c0_0, %12 : index
        %14 = arith.addi %12, %c1_1 : index
        %15 = arith.select %8, %13, %14 : index
        %16 = arith.muli %7, %15 overflow<nsw> : index
        %c1_2 = arith.constant 1 : index
        %c1_3 = arith.constant 1 : index
        hal.return %16, %c1_2, %c1_3 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128", llvm.target_triple = "riscv64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @matmul_dynamic_dispatch_0_pack_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(1 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(-1 : index) : i64
          %4 = llvm.mlir.constant(-64 : index) : i64
          %5 = llvm.mlir.constant(-8 : index) : i64
          %6 = llvm.mlir.constant(64 : index) : i64
          %7 = llvm.mlir.constant(1 : i32) : i32
          %8 = llvm.mlir.constant(1 : index) : i64
          %9 = llvm.mlir.constant(8 : index) : i64
          %10 = llvm.mlir.constant(0 : i64) : i64
          %11 = llvm.mlir.constant(32 : i64) : i64
          %12 = llvm.mlir.constant(0 : index) : i64
          %13 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.extractvalue %13[9] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %15 = llvm.getelementptr %14[2] : (!llvm.ptr) -> !llvm.ptr, i32
          %16 = llvm.load %15 : !llvm.ptr -> i32
          %17 = llvm.getelementptr %14[3] : (!llvm.ptr) -> !llvm.ptr, i32
          %18 = llvm.load %17 : !llvm.ptr -> i32
          %19 = llvm.getelementptr %14[4] : (!llvm.ptr) -> !llvm.ptr, i32
          %20 = llvm.load %19 : !llvm.ptr -> i32
          %21 = llvm.getelementptr %14[5] : (!llvm.ptr) -> !llvm.ptr, i32
          %22 = llvm.load %21 : !llvm.ptr -> i32
          %23 = llvm.zext %16 : i32 to i64
          %24 = llvm.zext %18 : i32 to i64
          %25 = llvm.shl %24, %11 : i64
          %26 = llvm.or %23, %25 : i64
          %27 = llvm.zext %20 : i32 to i64
          %28 = llvm.zext %22 : i32 to i64
          %29 = llvm.shl %28, %11 : i64
          %30 = llvm.or %27, %29 : i64
          %31 = llvm.extractvalue %13[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
          %33 = llvm.mul %30, %9 overflow<nsw> : i64
          %34 = llvm.getelementptr %31[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %35 = llvm.load %34 : !llvm.ptr -> !llvm.ptr
          %36 = llvm.icmp "sle" %30, %12 : i64
          %37 = llvm.sub %12, %30 : i64
          %38 = llvm.sub %30, %8 : i64
          %39 = llvm.select %36, %37, %38 : i1, i64
          %40 = llvm.sdiv %39, %6 : i64
          %41 = llvm.sub %12, %40 : i64
          %42 = llvm.add %40, %8 : i64
          %43 = llvm.select %36, %41, %42 : i1, i64
          %44 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %45 = llvm.extractvalue %44[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %46 = llvm.zext %45 : i32 to i64
          %47 = llvm.sdiv %46, %43 : i64
          %48 = llvm.mul %47, %43 : i64
          %49 = llvm.icmp "ne" %46, %48 : i64
          %50 = llvm.icmp "slt" %46, %12 : i64
          %51 = llvm.icmp "slt" %43, %12 : i64
          %52 = llvm.icmp "ne" %50, %51 : i1
          %53 = llvm.and %49, %52 : i1
          %54 = llvm.add %47, %3 : i64
          %55 = llvm.select %53, %54, %47 : i1, i64
          %56 = llvm.srem %46, %43 : i64
          %57 = llvm.icmp "slt" %56, %12 : i64
          %58 = llvm.add %56, %43 overflow<nsw> : i64
          %59 = llvm.select %57, %58, %56 : i1, i64
          %60 = llvm.mul %55, %9 overflow<nsw> : i64
          %61 = llvm.mul %59, %6 overflow<nsw> : i64
          %62 = llvm.mul %55, %5 overflow<nsw> : i64
          %63 = llvm.add %62, %26 : i64
          %64 = llvm.icmp "slt" %63, %9 : i64
          %65 = llvm.select %64, %63, %9 : i1, i64
          %66 = llvm.mul %59, %4 overflow<nsw> : i64
          %67 = llvm.add %66, %30 : i64
          %68 = llvm.icmp "slt" %67, %6 : i64
          %69 = llvm.select %68, %67, %6 : i1, i64
          %70 = llvm.mul %55, %6 overflow<nsw> : i64
          %71 = llvm.mul %65, %9 overflow<nsw> : i64
          %72 = llvm.mul %70, %30 overflow<nsw> : i64
          %73 = llvm.add %72, %61 : i64
          %74 = llvm.mul %61, %9 overflow<nsw> : i64
          %75 = llvm.mul %60, %33 overflow<nsw> : i64
          %76 = llvm.add %74, %75 : i64
          %77 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %78 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %79 = llvm.load %77 : !llvm.ptr -> i64
          %80 = llvm.or %79, %0 : i64
          llvm.store %80, %78 : i64, !llvm.ptr
          %81 = llvm.getelementptr inbounds %77[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %82 = llvm.load %81 : !llvm.ptr -> i64
          %83 = llvm.getelementptr inbounds %78[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %82, %83 : i64, !llvm.ptr
          %84 = llvm.getelementptr inbounds %77[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %85 = llvm.load %84 : !llvm.ptr -> i64
          %86 = llvm.getelementptr inbounds %78[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %85, %86 : i64, !llvm.ptr
          %87 = llvm.getelementptr inbounds %77[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %88 = llvm.load %87 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %78[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.getelementptr inbounds %77[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %91 = llvm.load %90 : !llvm.ptr -> i64
          %92 = llvm.getelementptr inbounds %78[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %91, %92 : i64, !llvm.ptr
          %93 = llvm.getelementptr inbounds %77[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %94 = llvm.load %93 : !llvm.ptr -> i64
          %95 = llvm.getelementptr inbounds %78[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %94, %95 : i64, !llvm.ptr
          %96 = llvm.getelementptr inbounds %77[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %97 = llvm.load %96 : !llvm.ptr -> i64
          %98 = llvm.getelementptr inbounds %78[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %97, %98 : i64, !llvm.ptr
          %99 = llvm.getelementptr inbounds %77[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %100 = llvm.load %99 : !llvm.ptr -> i64
          %101 = llvm.getelementptr inbounds %78[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %100, %101 : i64, !llvm.ptr
          %102 = llvm.call @iree_uk_pack(%32, %73, %30, %8, %35, %76, %33, %9, %71, %69, %65, %69, %9, %8, %10, %7, %78) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
        }
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
      stream.cmd.dispatch @matmul_dynamic_dispatch_0::@embedded_elf_riscv_64::@matmul_dynamic_dispatch_0_pack_f32[%0, %5, %1](%9, %11, %13, %15, %17, %19 : i32, i32, i32, i32, i32, i32) {
        ro %arg1[%c0 for %3] : !stream.resource<external>{%3},
        wo %arg2[%c0 for %7] : !stream.resource<external>{%7}
      }
    } => !stream.timepoint
    %21 = stream.timepoint.await %20 => %result : !stream.resource<external>{%7}
    %22 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %21 : tensor<?x?x8x1xf32>{%5, %1} in !stream.resource<external>{%7} -> !hal.buffer_view
    util.return %22 : !hal.buffer_view
  }
}
