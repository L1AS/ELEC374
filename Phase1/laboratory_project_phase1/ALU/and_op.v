module and_op (
  output wire[31:0] and_out,
  input wire[31:0] A_reg, B_reg
);
  assign and_out = A_reg & B_reg;
endmodule