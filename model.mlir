#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
func.func @matmul_reduce_32_1024_2048(%lhs: tensor<32x1024xf16>, %rhs: tensor<1024x2048xf16>) -> tensor<32xf32> {
  %c0_f16 = arith.constant 0.0: f16
  %c1 = arith.constant dense<1.000000e+00> : tensor<32xf16>

  // perform a matmul
  %mm_acc = tensor.empty() : tensor<32x2048xf32>
  %mm_fill = linalg.fill ins(%c0_f16 : f16) outs(%mm_acc :tensor<32x2048xf32>) -> tensor<32x2048xf32>
  %mm = linalg.matmul ins(%lhs, %rhs: tensor<32x1024xf16>, tensor<1024x2048xf16>) outs(%mm_fill: tensor<32x2048xf32>) -> tensor<32x2048xf32>

  // sum over last dimension
  %c0_f32 = arith.constant 0.0: f32
  %red_acc = tensor.empty() : tensor<32xf32>
  %red_fill = linalg.fill ins(%c0_f32 : f32) outs(%red_acc : tensor<32xf32>) -> tensor<32xf32>
  %red = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%mm : tensor<32x2048xf32>) outs(%red_fill : tensor<32xf32>)  {
  ^bb0(%in: f32, %out: f32):
    %7 = arith.addf %in, %out : f32
    linalg.yield %7 : f32
  } -> tensor<32xf32>
  return %red: tensor<32xf32>
}
