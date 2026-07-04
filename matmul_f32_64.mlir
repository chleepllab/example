func.func @matmul(%lhs: tensor<64x64xf32>, %rhs: tensor<64x64xf32>, %acc: tensor<64x64xf32>) -> tensor<64x64xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<64x64xf32>, tensor<64x64xf32>) outs(%acc: tensor<64x64xf32>) -> tensor<64x64xf32>
  return %result: tensor<64x64xf32>
}
