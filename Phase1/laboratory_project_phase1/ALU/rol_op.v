module rol_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] rol_out
);

  assign rol_out = (A_reg << B_reg | A_reg >> (32 - B_reg));
  
endmodule