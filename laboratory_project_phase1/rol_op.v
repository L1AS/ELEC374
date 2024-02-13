module rol_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] rol_out
);

  assign rol_out = {A_reg[31-Breg:0], A_reg[31:32-B_reg]};
  
endmodule