func.func @conv_dynamic(%in: tensor<?x?x?x?xf32>, %filter: tensor<?x?x?x?xf32>, %out: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
  %result = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<4> : vector<2xi64>} ins(%in, %filter: tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%out: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
  return %result: tensor<?x?x?x?xf32>
}
