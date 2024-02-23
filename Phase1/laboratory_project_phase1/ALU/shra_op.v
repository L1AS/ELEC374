module shra_op(
  input [31:0] A_reg,
  input [31:0] B_reg,
  output [31:0] shra_out
);

  assign shra_out = A_reg >>> B_reg;

endmodule