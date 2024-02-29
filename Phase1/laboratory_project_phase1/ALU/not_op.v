module not_op (
  output wire[31:0] not_out,
  input wire[31:0] B_reg  
);

  assign not_out = ~B_reg;
  
endmodule