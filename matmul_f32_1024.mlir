func.func @matmul(%lhs: tensor<1024x1024xf32>, %rhs: tensor<1024x1024xf32>, %acc: tensor<1024x1024xf32>) -> tensor<1024x1024xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<1024x1024xf32>, tensor<1024x1024xf32>) outs(%acc: tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
  return %result: tensor<1024x1024xf32>
}
