module and_op (
  input wire[31:0] Areg, Breg,
  output wire[31:0] Andout
);

  assign Andout = Areg & Breg;
  
endmodule