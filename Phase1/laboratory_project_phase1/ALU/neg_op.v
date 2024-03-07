module neg_op (
<<<<<<< HEAD
  input wire[31:0] B_reg,
  output wire[31:0] neg_out
=======
  output wire[31:0] neg_out,
  input wire[31:0] B_reg
>>>>>>> main
);

  assign neg_out = -B_reg;
  
endmodule