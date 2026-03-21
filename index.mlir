func.func @forward(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: f32) -> tensor<?xf32> {
  %result = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in_1: f32, %in_2: f32, %out: f32):
      %1 = arith.addf %in_1, %in_2 : f32
      %2 = arith.mulf %arg3, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
  return %result: tensor<?xf32>
}
