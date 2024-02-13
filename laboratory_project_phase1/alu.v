module alu (
  input clear, clock, IncPC
  input wire [31:0] A_reg, B_reg, // ALU 32-bit inputs
  input [3:0] opcode,
  output reg [63:0] out_result
);

  parameter and = 5'b0000, or = 5'b0001, add = 5'b0010, sub = 5'b0011,
            mul = 5'b0100, div = 5'b0101, shr = 5'b0110, shra = 5'b0111,
            shl = 5'b1000, ror = 5'b1001, rol = 5'b1010, neg = 5'b1011,
            not = 5'b1100;

  wire [31:0] IncPC_out, and_out, or_out, add_out, sub_out, shr_out,
              shra_out, shl_out, ror_out, rol_out, neg_out, not_out;
  wire [63:0] div_out, mul_out;

  always @(*) begin
    case(opcode)
      and: begin
        out_result[31:0] <= and_out;
        out_result[64:32] <= 32'b0;
      end
      or: begin
        out_result[31:0] <= or_out;
        out_result[64:32] <= 32'b0;
      end
      add: begin
        out_result[31:0] <= add_out;
        out_result[64:32] <= 32'b0;
      end
      sub: begin
        out_result[31:0] <= sub_out;
        out_result[64:32] <= 32'b0;
      end
      mul: begin
        out_result <= mul_out;
      end
      div: begin
        out_result[64:0] <= div_out;
      end
      shr: begin
        out_result[31:0] <= shr_out;
        out_result[64:32] <= 32'b0;
      end
      shra: begin
        out_result[31:0] <= shra_out;
        out_result[64:32] <= 32'b0;
      end
      shl: begin
        out_result[31:0] <= shl_out;
        out_result[64:32] <= 32'b0;
      end
      ror: begin
        out_result[31:0] <= ror_out;
        out_result[64:32] <= 32'b0;
      end
      rol: begin
        out_result[31:0] <= rol_out;
        out_result[64:32] <= 32'b0;
      end
      neg: begin
        out_result[31:0] <= neg_out;
        out_result[64:32] <= 32'b0;
      end
      not: begin
        out_result[31:0] <= not_out;
        out_result[64:32] <= 32'b0;
      end
      default: begin
        out_result = 64'b0;
      end
    endcase
  end

  IncPC pc_inc(A_reg, IncPC IncPC_out);
  add_op add (add_out); // DONE
  sub_op sub (sub_out); // TODO
  mul_op dul (A_reg, B_reg, mul_out); // TODO
  div_op div (A_reg, B_reg, div_out); // TODO

  shr_op shr (A_reg, B_reg, shr_out); // TODO
  shra_op shra (A_reg, B_reg, shra_out); // TODO
  shl_op shl (A_reg, B_reg, shl_out); // TODO
  ror_op ror (A_reg, B_reg, ror_out); // DONE
  rol_op aol (A_reg, B_reg, rol_out); // DONE
  and_op and (A_reg, B_reg, Andout); 
  or_op or (A_reg, B_reg, orout); 
  neg_op neg (B_reg, neg_out);
  not_op not (B_reg, not_out);
  
endmodule