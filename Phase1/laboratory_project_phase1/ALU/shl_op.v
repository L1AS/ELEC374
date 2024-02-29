module shl_op(
  output [31:0] shl_out,
  input [31:0] A_reg, B_reg
);

  assign shl_out = A_reg << B_reg;

endmodule