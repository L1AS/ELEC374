module neg_op (
  input wire[31:0] B_reg,
  output wire[31:0] neg_out
);

  assign neg_out = -B_reg;
  
endmodule