module or_op (
  output wire[31:0] or_out,
  input wire[31:0] A_reg, B_reg  
);

  assign or_out = A_reg | B_reg;
  
endmodule