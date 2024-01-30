module ror_op (
  input wire[31:0] Areg, Breg,
  output wire[31:0] Rorout
);

  Rorout = {Areg[Breg-1:0], Areg[31:Breg]}; // Rotate Right

endmodule