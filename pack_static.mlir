func.func @pack_static(%lhs: tensor<64x1024xf32>) -> tensor<8x1024x8x1xf32> attributes { iree.compiler.export } {
  %init = tensor.empty() : tensor<8x1024x8x1xf32>
  %result = linalg.pack %lhs inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %init
      : tensor<64x1024xf32> -> tensor<8x1024x8x1xf32>
  return %result: tensor<8x1024x8x1xf32>
}
