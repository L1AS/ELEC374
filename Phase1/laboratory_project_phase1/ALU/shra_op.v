<<<<<<< HEAD
module shra_op(
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] shra_out
);

  assign shra_out = 32'b0;

=======
module shra_op(
  output signed [31:0] shra_out,
  input signed [31:0] A_reg, B_reg
);

  assign shra_out = A_reg >>> B_reg;

>>>>>>> main
endmodule