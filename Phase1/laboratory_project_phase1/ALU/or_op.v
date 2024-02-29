module or_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] or_out
);

  assign or_out = A_reg | B_reg;
  
endmodule