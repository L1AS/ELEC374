module alu (
  input clear, clock,
  input wire [31:0] Areg, Breg, // ALU 32-bit inputs
  input [3:0] opcode,
  output reg [63:0] out_Result
);

parameter add = 5'b0000, sub = 5'b0001, mul = 5'b0010, div = 5'b0011,
// opcodes
/*
0000 = add
0001 = sub
0010 = mul
0011 = div
0100 = shr
0101 = shra

*/

  add_op Add (Addout); // DONE
  sub_op Sub (Subout); // TODO
  mul_op Mul (Areg, Breg, Mulout); // TODO
  div_op Div (Areg, Breg, Divout); // TODO

  shr_op Shr (Areg, Breg, Shrout); // TODO
  shra_op Shra (Areg, Breg, Shraout); // TODO
  shl_op Shl (Areg, Breg, Shlout); // TODO
  ror_op Ror (Areg, Breg, Rorout); // DONE
  rol_op Rol (Areg, Breg, Rolout); // DONE
  and_op And (Areg, Breg, Andout); 
  or_op Or (Areg, Breg, Orout); 
  neg_op Neg (Breg, Negout);
  not_op Not (Breg, Notout);

endmodule