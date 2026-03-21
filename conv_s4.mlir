func.func @conv_dynamic(%in: tensor<1x3x68x68xf32>, %filter: tensor<64x3x11x11xf32>, %out: tensor<1x64x15x15xf32>) -> tensor<1x64x15x15xf32> {
  %result = linalg.conv_2d_nchw_fchw  {dilations = dense<1> : vector<2xi64>, strides = dense<4> : vector<2xi64>} ins(%in, %filter: tensor<1x3x68x68xf32>, tensor<64x3x11x11xf32>) outs(%out: tensor<1x64x15x15xf32>) -> tensor<1x64x15x15xf32>
  return %result: tensor<1x64x15x15xf32>
}
