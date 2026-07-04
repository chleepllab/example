func.func @matmul(%lhs: tensor<64x64xbf16>, %rhs: tensor<64x64xbf16>, %acc: tensor<64x64xf32>) -> tensor<64x64xf32> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<64x64xbf16>, tensor<64x64xbf16>) outs(%acc: tensor<64x64xf32>) -> tensor<64x64xf32>
  return %result: tensor<64x64xf32>
}
