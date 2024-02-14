module alu (
  input clear, clock,
  input wire [31:0] Areg, Breg, // ALU 32-bit inputs
  input [3:0] opcode,
  output reg [63:0] out_Result
);
  // opcodes
  /*
  0000 = add
  0001 = sub
  0010 = mul
  0011 = div
  0100 = shr
  0101 = shra
  0110 = shl
  0111 = ror
  1000 = rol
  1001 = and
  1010 = or
  1011 = neg
  1100 = not

  */
  wire [31:0] w_add_result, w_sub_result;

  add_op adder (
    .in_add1 (Areg),
    .in_add2 (Breg),
    .out_Sum (w_add_result)
  )

  sub_op substraction (
    .in_term1 (Areg),
    .in_term2 (Breg),
    .out_difference (w_sub_result)
  )
  
  always @(*) begin
    case (opcode)
      4b'0000: // addition
        out_Result = w_add_result;
      4b'0001: //substraction
        out_Result = w_sub_result;
      default: 
    endcase
    
  end
  add_op Add (Addout); // DONE
  sub_op Sub (Subout); // DONE
  mul_op Mul (Areg, Breg, Mulout); // DONE
  div_op Div (Areg, Breg, Divout); // DONE

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