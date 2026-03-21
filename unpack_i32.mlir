func.func @matmul_dynamic(%lhs: tensor<?x?x8x1xi32>) -> tensor<?x?xi32> attributes { iree.compiler.export } {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %dim0 = tensor.dim %lhs, %c0 : tensor<?x?x8x1xi32>
  %dim1 = tensor.dim %lhs, %c1 : tensor<?x?x8x1xi32>
  %dim0_mul = arith.muli %dim0, %c8 : index
  %dim1_mul = arith.muli %dim1, %c1 : index
  %init = tensor.empty(%dim0_mul, %dim1_mul) : tensor<?x?xi32>
  %result = linalg.unpack %lhs inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %init
      : tensor<?x?x8x1xi32> -> tensor<?x?xi32>
  return %result: tensor<?x?xi32>
}
