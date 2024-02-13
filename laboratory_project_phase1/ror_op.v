module ror_op (
  input wire[31:0] A_reg, B_reg,
  output wire[31:0] ror_out
);

  assign ror_out = {A_reg[B_reg-1:0], A_reg[31:B_reg]}; // Rotate Right

endmodule