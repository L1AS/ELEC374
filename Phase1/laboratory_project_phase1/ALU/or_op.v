module or_op (
<<<<<<< HEAD
  input wire[31:0] Areg, Breg,
  output wire[31:0] Orout
);

  assign Orout = Areg | Breg;
=======
  output wire[31:0] or_out,
  input wire[31:0] A_reg, B_reg  
);

  assign or_out = A_reg | B_reg;
>>>>>>> main
  
endmodule