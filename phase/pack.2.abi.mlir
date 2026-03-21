module {
  util.func public @matmul_dynamic(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @matmul_dynamic(%input0: tensor<?x?xf32>) -> (%output0: tensor<?x?x8x1xf32>)"}} {
    %c8 = arith.constant 8 : index
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<?x?xf32>{%0, %1}
    %3 = arith.ceildivsi %0, %c8 : index
    %4 = tensor.empty(%3, %1) : tensor<?x?x8x1xf32>
    %pack = linalg.pack %2 inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %4 : tensor<?x?xf32> -> tensor<?x?x8x1xf32>
    %5 = hal.tensor.export %pack "output0" : tensor<?x?x8x1xf32>{%3, %1} -> !hal.buffer_view
    util.return %5 : !hal.buffer_view
  }
}
