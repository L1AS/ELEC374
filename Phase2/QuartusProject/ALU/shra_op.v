module shra_op(
  output signed [31:0] shra_out,
  input signed [31:0] A_reg, B_reg
);

  assign shra_out = A_reg >>> B_reg;

endmodule