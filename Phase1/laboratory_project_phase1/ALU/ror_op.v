module ror_op (
  output wire[31:0] ror_out,
  input wire[31:0] A_reg, B_reg
);

  assign ror_out = (A_reg << (32 - B_reg) | A_reg >> B_reg); // Rotate Right

endmodule