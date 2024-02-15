module and_op (
  input wire[31:0] Areg, Breg,
  output wire[31:0] Orout
);

  assign Orout = Areg | Breg;
  
endmodule