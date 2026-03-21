module attributes {iree_codegen.tuning_spec_with_default_entrypoint, transform.with_named_sequence} {
  transform.named_sequence @apply_op_config(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.any_param {transform.readonly}) {
    transform.annotate %arg0 "compilation_info" = %arg1 : !transform.any_op, !transform.any_param
    transform.yield
  }
  transform.named_sequence @match_matmul_static_dispatch_0(%arg0: !transform.any_op {transform.readonly}) -> (!transform.any_op, !transform.any_param) {
    %inputs, %outputs = transform.iree.match.cast_compatible_dag_from_root %arg0 {
      ^bb0(%arg1: tensor<32x64xf32>, %arg2: tensor<64x64xf32>, %arg3: tensor<32x64xf32>):
      %1 = linalg.matmul ins(%arg1, %arg2 : tensor<32x64xf32>, tensor<64x64xf32>) outs(%arg3 : tensor<32x64xf32>) -> tensor<32x64xf32>
    } : (!transform.any_op) -> (!transform.any_value, !transform.any_value)
    %0 = transform.param.constant #iree_codegen.compilation_info<
      lowering_config = #iree_codegen.lowering_config<
        tile_sizes = [[16, 256], [8, 8], [0, 0, 4]]
      >,
      translation_info = <
        pipeline = SPIRVBaseVectorize
        workgroup_size = [64, 2, 1]
      >
    > -> !transform.any_param
    transform.yield %arg0, %0 : !transform.any_op, !transform.any_param
  }
  transform.named_sequence @__kernel_config(%arg0: !transform.any_op {transform.consumed}) -> !transform.any_op attributes {iree_codegen.tuning_spec_entrypoint} {
    %updated_root = transform.foreach_match in %arg0
        @match_matmul_static_dispatch_0 -> @apply_op_config : (!transform.any_op) -> !transform.any_op
    transform.yield %updated_root : !transform.any_op
  }
}
