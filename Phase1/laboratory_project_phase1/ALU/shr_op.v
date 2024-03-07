<<<<<<< HEAD
module shr_op(
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] shr_out
);

  assign shr_out = 32'b0;

=======
module shr_op(
  output [31:0] shr_out,
  input [31:0] A_reg, B_reg
);

  assign shr_out = A_reg >> B_reg;

>>>>>>> main
endmodule