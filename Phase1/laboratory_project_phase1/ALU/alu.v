module alu (
  input IncPC,
  input wire [31:0] A_reg, B_reg, // ALU 32-bit inputs
  input [4:0] opcode,
  output reg [63:0] out_result
);

  parameter anding = 5'b01010, oring = 5'b01011, addition = 5'b00011, subtraction = 5'b00100,
            multiply= 5'b01111, divide = 5'b10000, shift_R = 5'b00101, shift_RA= 5'b00110,
            shift_L = 5'b00111, rotate_R = 5'b01000, rotate_L = 5'b01001, negate = 5'b10001,
            noting = 5'b10010, nop = 5'b11010;

  wire [31:0] IncPC_out, and_out, or_out, add_out, sub_out, shr_out,
              shra_out, shl_out, ror_out, rol_out, neg_out, not_out,
              div_remain, div_quotient;
  wire [63:0] mul_out;

  always @(*) begin
    out_result <= 64'b0;
    case(opcode)
      anding: begin
        out_result[31:0] <= and_out;
        out_result[63:32] <= 32'b0;
      end
      oring: begin
        out_result[31:0] <= or_out;
        out_result[63:32] <= 32'b0;
      end
      addition: begin
        out_result[31:0] <= add_out;
        out_result[63:32] <= 32'b0;
      end
      subtraction: begin
        out_result[31:0] <= sub_out;
        out_result[63:32] <= 32'b0;
      end
      multiply: begin
        out_result <= mul_out;
      end
      divide: begin
        out_result[63:32] <= div_remain;
        out_result[31:0] <= div_quotient;
      end
      shift_R: begin
        out_result[31:0] <= shr_out;
        out_result[63:32] <= 32'b0;
      end
      shift_RA: begin
        out_result[31:0] <= shra_out;
        out_result[63:32] <= 32'b0;
      end
      shift_L: begin
        out_result[31:0] <= shl_out;
        out_result[63:32] <= 32'b0;
      end
      rotate_R: begin
        out_result[31:0] <= ror_out;
        out_result[63:32] <= 32'b0;
      end
      rotate_L: begin
        out_result[31:0] <= rol_out;
        out_result[63:32] <= 32'b0;
      end
      negate: begin
        out_result[31:0] <= neg_out;
        out_result[63:32] <= 32'b0;
      end
      noting: begin
        out_result[31:0] <= not_out;
        out_result[63:32] <= 32'b0;
      end
      nop: begin

      end 
      default: begin
        out_result <= 64'b0;
      end
    endcase

    if(IncPC) begin
		out_result[31:0] <= IncPC_out;
	   out_result[63:32] <= 32'b0;
	 end 
  end
  
  IncPC pc_inc(A_reg, IncPC, IncPC_out);
  add_op add (A_reg, B_reg, 1'b0, add_out); // DONE
  sub_op sub (A_reg, B_reg, sub_out); // TODO
  mul_op dul (A_reg, B_reg, mul_out); // TODO
  div_op div (A_reg, B_reg, div_remain, div_quotient); // TODO

  shr_op shr (A_reg, B_reg, shr_out); // TODO
  shra_op shra (A_reg, B_reg, shra_out); // TODO
  shl_op shl (A_reg, B_reg, shl_out); // TODO
  ror_op ror (A_reg, B_reg, ror_out); // DONE
  rol_op aol (A_reg, B_reg, rol_out); // DONE
  and_op and_ (A_reg, B_reg, and_out); 
  or_op or_ (A_reg, B_reg, or_out); 
  neg_op neg (B_reg, neg_out);
  not_op not_ (B_reg, not_out);
  
endmodule