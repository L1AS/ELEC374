module shr_op(
  input [31:0] A_reg, B_reg,
  output [31:0] shr_out
);

  assign shr_out = A_reg >> B_reg;

endmodule