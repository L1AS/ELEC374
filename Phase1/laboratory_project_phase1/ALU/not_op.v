module not_op (
  input wire[31:0] B_reg,
  output wire[31:0] not_out
);

  assign not_out = ~B_reg;
  
endmodule