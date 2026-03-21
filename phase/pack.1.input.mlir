module {
  util.func public @matmul_dynamic(%arg0: tensor<?x?xf32>) -> tensor<?x?x8x1xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = arith.ceildivsi %dim, %c8 : index
    %1 = tensor.empty(%0, %dim_0) : tensor<?x?x8x1xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %1 : tensor<?x?xf32> -> tensor<?x?x8x1xf32>
    util.return %pack : tensor<?x?x8x1xf32>
  }
}
