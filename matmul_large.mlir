func.func @matmul_static(%lhs: tensor<32x1024xf32>, %rhs: tensor<1024x2048xf32>, %acc: tensor<32x2048xf32>) -> tensor<32x2048xf32> attributes { iree.compiler.export } {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<32x1024xf32>, tensor<1024x2048xf32>) outs(%acc: tensor<32x2048xf32>) -> tensor<32x2048xf32>
  return %result: tensor<32x2048xf32>
}
