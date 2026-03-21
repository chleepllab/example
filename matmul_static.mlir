func.func @matmul_dynamic(%lhs: tensor<64x1024xf32>, %rhs: tensor<1024x2048xf32>, %acc: tensor<64x2048xf32>) -> tensor<64x2048xf32> attributes { iree.compiler.export } {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<64x1024xf32>, tensor<1024x2048xf32>) outs(%acc: tensor<64x2048xf32>) -> tensor<64x2048xf32>
  return %result: tensor<64x2048xf32>
}
