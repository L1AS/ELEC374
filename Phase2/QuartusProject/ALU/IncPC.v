module IncPC(
  output[31:0] IncPC_out,
  input[31:0] A_reg,
  input IncPC  // control signal
);
  assign IncPC_out = A_reg + IncPC; //questionable
endmodule