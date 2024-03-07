module and_op (
<<<<<<< HEAD
  input wire[31:0] Areg, Breg,
  output wire[31:0] Andout
);

  assign Andout = Areg & Breg;
  
=======
  output wire[31:0] and_out,
  input wire[31:0] A_reg, B_reg
);
  assign and_out = A_reg & B_reg;
>>>>>>> main
endmodule