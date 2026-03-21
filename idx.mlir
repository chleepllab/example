func.func @forward() -> tensor<500x750xi32> {
  %0 = tensor.empty() : tensor<500x750xi32>
  %result = linalg.generic {
      indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>],
      iterator_types = ["parallel", "parallel"]}
      outs(%0 : tensor<500x750xi32>) {
      ^bb0(%arg0 : i32):
        %2 = linalg.index 0 : index
        %3 = linalg.index 1 : index
        %4 = arith.index_cast %2 : index to i32
        %c750_i32 = arith.constant 750 : i32
        %5 = arith.muli %4, %c750_i32 : i32
        %6 = arith.index_cast %3 : index to i32
        %7 = arith.addi %5, %6 : i32
        linalg.yield %7 : i32
      } -> tensor<500x750xi32>
  return %result: tensor<500x750xi32>
}
