module shl_op(
  input [31:0] A_reg, B_reg,
  output [31:0] shl_out
);

  assign shl_out = A_reg << B_reg;

endmodule