func.func @matmul(%lhs: tensor<512x512xf32>, %rhs: tensor<512x512xf32>, %acc: tensor<512x512xf32>) -> tensor<512x512xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<512x512xf32>, tensor<512x512xf32>) outs(%acc: tensor<512x512xf32>) -> tensor<512x512xf32>
  return %result: tensor<512x512xf32>
}
