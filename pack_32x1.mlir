func.func @matmul_dynamic(%lhs: tensor<?x?xf32>) -> tensor<?x?x32x1xf32> attributes { iree.compiler.export } {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %dim0 = tensor.dim %lhs, %c0 : tensor<?x?xf32>
  %dim1 = tensor.dim %lhs, %c1 : tensor<?x?xf32>
  %dim0_div = arith.ceildivsi %dim0, %c32 : index
  %dim1_div = arith.ceildivsi %dim1, %c1 : index
  %init = tensor.empty(%dim0_div, %dim1_div) : tensor<?x?x32x1xf32>
  %result = linalg.pack %lhs outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [32, 1] into %init
      : tensor<?x?xf32> -> tensor<?x?x32x1xf32>
  return %result: tensor<?x?x32x1xf32>
}
