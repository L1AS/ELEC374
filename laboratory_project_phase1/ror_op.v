module ror_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] ror_out
);

  assign ror_out = (A_reg << (32 - B_reg) | A_reg >> B_reg); // Rotate Right

endmodule