module neg_op (
  output wire[31:0] neg_out,
  input wire[31:0] B_reg
);

  assign neg_out = -B_reg;
  
endmodule