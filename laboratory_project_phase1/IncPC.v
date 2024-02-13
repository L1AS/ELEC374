module IncPC(
  input[31:0] A_reg,
  input IncPC,  // control signal
  output[31:0] IncPC_out
);

  assign IncPC_out = A_reg + IncPC; //questionable
  
endmodule