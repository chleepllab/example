func.func @matmul_dynamic(%lhs: tensor<?x?xi8>, %rhs: tensor<?x?xi8>, %acc: tensor<?x?xi8>) -> tensor<?x?xi8> {
  %result = linalg.matmul ins(%lhs, %rhs: tensor<?x?xi8>, tensor<?x?xi8>) outs(%acc: tensor<?x?xi8>) -> tensor<?x?xi8>
  return %result: tensor<?x?xi8>
}
