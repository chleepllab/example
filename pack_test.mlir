func.func @matmul_dynamic(%lhs: tensor<4x4xf32>) -> tensor<2x2x2x2xf32> attributes { iree.compiler.export } {
  %init = tensor.empty() : tensor<2x2x2x2xf32>
  %result = linalg.pack %lhs inner_dims_pos = [0, 1] inner_tiles = [2, 2] into %init
      : tensor<4x4xf32> -> tensor<2x2x2x2xf32>
  return %result: tensor<2x2x2x2xf32>
}
