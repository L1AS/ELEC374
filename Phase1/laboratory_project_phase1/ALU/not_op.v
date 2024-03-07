module not_op (
<<<<<<< HEAD
  input wire[31:0] Breg,
  output wire[31:0] Notout
);

  assign Notout = ~Breg;
=======
  output wire[31:0] not_out,
  input wire[31:0] B_reg  
);

  assign not_out = ~B_reg;
>>>>>>> main
  
endmodule