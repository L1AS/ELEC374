module shra_op(
  output [31:0] shra_out,
  input [31:0] A_reg, B_reg
);

  assign shra_out = A_reg >>> B_reg;

endmodule