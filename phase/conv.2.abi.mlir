module {
  util.func public @conv_dynamic(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @conv_dynamic(%input0: tensor<?x?x?x?xf32>, %input1: tensor<?x?x?x?xf32>, %input2: tensor<?x?x?x?xf32>) -> (%output0: tensor<?x?x?x?xf32>)"}} {
    %0 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[0] : index
    %1 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[1] : index
    %2 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[2] : index
    %3 = hal.buffer_view.dim<%arg0 : !hal.buffer_view>[3] : index
    %4 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%0, %1, %2, %3}
    %5 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[0] : index
    %6 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[1] : index
    %7 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[2] : index
    %8 = hal.buffer_view.dim<%arg1 : !hal.buffer_view>[3] : index
    %9 = hal.tensor.import %arg1 "input1" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%5, %6, %7, %8}
    %10 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[0] : index
    %11 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[1] : index
    %12 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[2] : index
    %13 = hal.buffer_view.dim<%arg2 : !hal.buffer_view>[3] : index
    %14 = hal.tensor.import %arg2 "input2" : !hal.buffer_view -> tensor<?x?x?x?xf32>{%10, %11, %12, %13}
    %15 = linalg.conv_2d_nchw_fchw ins(%4, %9 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%14 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %16 = hal.tensor.export %15 "output0" : tensor<?x?x?x?xf32>{%10, %11, %12, %13} -> !hal.buffer_view
    util.return %16 : !hal.buffer_view
  }
}
