func.func @matmul(%lhs: tensor<256x256xf32>, %rhs: tensor<256x256xf32>, %acc: tensor<256x256xf32>) -> tensor<256x256xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<256x256xf32>, tensor<256x256xf32>) outs(%acc: tensor<256x256xf32>) -> tensor<256x256xf32>
  return %result: tensor<256x256xf32>
}
