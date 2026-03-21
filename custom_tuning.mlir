module {
  // Main tuning specification
  #tuning_spec = #iree_codegen.tuning_spec<
    // Matmul-specific configuration
    matmul = {
      // Tile sizes for [M, N, K] dimensions
      // Optimal for RISC-V's vector registers (512-bit)
      tile_sizes = [32, 64, 128],
      
      // Enable operand promotion to faster memory
      promotion = true,
      
      // Vectorization parameters
      vector_size = 16,      // Elements per vector
      vectorize_m = true,    // Vectorize M dimension
      vectorize_n = true,    // Vectorize N dimension
      vectorize_k = false,   // Don't vectorize K (better for reduction)
      
      // Unrolling factors
      unroll_factor_m = 2,
      unroll_factor_n = 2,
      unroll_factor_k = 4,
      
      // RISC-V specific parameters
      riscv = {
        vlen = 512,          // Vector length in bits
        lmul = 2,            // LMUL setting (2 for 512-bit)
        sew = 32,            // Single element width (32-bit)
        use_masked = false   // Don't use masked ops
      },
      
      // Microkernel configuration
      ukernel = {
        enable = true,
        tile_m = 8,          // Micro tile M
        tile_n = 8,          // Micro tile N
        tile_k = 16          // Micro tile K
      }
    },
    
    // Additional global tuning
    global = {
      enable_peeling = true,  // Enable loop peeling
      enable_licm = true,     // Enable loop invariant code motion
      max_concurrency = 4     // Max thread parallelism
    }
  >

  // Optional: Specific configuration for different matmul shapes
  #large_matmul_tuning = #iree_codegen.tuning_spec<
    matmul = {
      tile_sizes = [64, 128, 256],  // For M/N/K > 512
      vector_size = 32,
      unroll_factor_k = 8
    }
  >

  // Entry point annotation example
  func.func @matmul_static(%lhs: tensor<32x64xf32>, %rhs: tensor<64x64xf32>) -> tensor<32x64xf32> {
    %init = tensor.empty() : tensor<32x64xf32>
    %result = linalg.matmul ins(%lhs, %rhs) outs(%init) -> tensor<32x64xf32>
    {lowering.config = #tuning_spec}  // Apply the tuning
    return %result : tensor<32x64xf32>
  }
}
