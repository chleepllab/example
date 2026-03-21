func.func @matmul_dynamic(%lhs: tensor<?x?xi32>) -> tensor<?x?x8x8xi32> attributes { iree.compiler.export } {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %dim0 = tensor.dim %lhs, %c0 : tensor<?x?xi32>
  %dim1 = tensor.dim %lhs, %c1 : tensor<?x?xi32>
  %dim0_div = arith.ceildivsi %dim0, %c8 : index
  %dim1_div = arith.ceildivsi %dim1, %c8 : index
  %init = tensor.empty(%dim0_div, %dim1_div) : tensor<?x?x8x8xi32>
  %result = linalg.pack %lhs inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %init
      : tensor<?x?xi32> -> tensor<?x?x8x8xi32>
  return %result: tensor<?x?x8x8xi32>
}
