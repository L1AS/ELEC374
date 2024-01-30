module alu (
  input clear, clock,
  input wire [31:0] Areg, Breg,
);

  add_op Add (Addout); // TODO
  sub_op Sub (Subout); // TODO
  mul_op Mul (Areg, Breg, Mulout); // TODO
  div_op Div (Areg, Breg, Divout); // TODO

  shr_op Shr (Areg, Breg, Shrout); // TODO
  shra_op Shra (Areg, Breg, Shraout); // TODO
  shl_op Shl (Areg, Breg, Shlout); // TODO
  ror_op Ror (Areg, Breg, Rorout); // TODO
  rol_op Rol (Areg, Breg, Rolout); // TODO
  and_op And (Areg, Breg, Andout); 
  or_op Or (Areg, Breg, Orout); 
  neg_op Neg (Breg, Negout);
  not_op Not (Breg, Notout);

endmodule