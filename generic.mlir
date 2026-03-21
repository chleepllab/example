func.func @matmul_dynamic(%lhs: tensor<?xf32>) -> tensor<?xf32> attributes { iree.compiler.export } {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = tensor.dim %lhs, %c0 : tensor<?xf32>
  %init = tensor.empty(%dim0) : tensor<?xf32>
  %result = linalg.generic {
    indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
    iterator_types = ["parallel"]
  } ins(%lhs : tensor<?xf32>) outs(%init : tensor<?xf32>) {
  ^bb0(%in: f32, %out: f32):
    %a = math.absf %in : f32
    linalg.yield %a : f32
  } -> tensor<?xf32>
  return %result: tensor<?xf32>
}
