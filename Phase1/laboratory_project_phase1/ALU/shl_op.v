<<<<<<< HEAD
module shl_op(
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] shl_out
);

  assign shl_out = 32'b0;

=======
module shl_op(
  output [31:0] shl_out,
  input [31:0] A_reg, B_reg
);

  assign shl_out = A_reg << B_reg;

>>>>>>> main
endmodule