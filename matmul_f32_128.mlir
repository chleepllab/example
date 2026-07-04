func.func @matmul(%lhs: tensor<128x128xf32>, %rhs: tensor<128x128xf32>, %acc: tensor<128x128xf32>) -> tensor<128x128xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<128x128xf32>, tensor<128x128xf32>) outs(%acc: tensor<128x128xf32>) -> tensor<128x128xf32>
  return %result: tensor<128x128xf32>
}
