module and_op (
  input wire[31:0] Breg,
  output wire[31:0] Negout
);

  assign Negout = -Breg;
  
endmodule