module shr_op(
  output [31:0] shr_out,
  input [31:0] A_reg, B_reg
);

  assign shr_out = A_reg >> B_reg;

endmodule