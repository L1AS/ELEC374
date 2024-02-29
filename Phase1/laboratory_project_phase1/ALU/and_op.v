module and_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] and_out
);
  assign and_out = A_reg & B_reg;
endmodule