module div_op(
  input [31:0] A_reg, B_reg,
  output reg [31:0] remainder, quotient 
);
  reg [31:0] M;
  reg [63:0] combined;
  reg subtract, negative; //control registers
  integer i;

  always @(*) begin
    // Initialize combined based on the signs of dividend and divisor
	 if(B_reg == 32'b0) begin
     remainder <= 32'hx;
     quotient <= 32'hx;
	 end
	 else begin 
      M = (B_reg[31] == 1) ? -B_reg : B_reg;
      combined = {32'b0, (A_reg[31] == 1) ? -A_reg : A_reg};
      negative = (A_reg[31] == 1) ^ (B_reg[31] == 1); // Result is negative if signs differ
    
      subtract = 1'b1;
    
      for(i = 0; i < 32; i = i + 1) begin : division_loop
        combined = {combined[62:0], 1'b0};  // shift left by 1

        combined[63:32] = subtract ? combined[63:32] - M : combined[63:32] + M; 

		  if(combined[63] == 1) begin
        subtract = 1'b0;
        combined[0] = 1'b0;
      end
      else begin
        subtract = 1'b1;
        combined[0] = 1'b1;
      end
      end
	    // Adjustment step: If the remainder is negative, add the divisor to it and adjust the quotient 
      remainder <= (combined[63] == 1) ? combined[63:32] + M : combined[63:32];
	   quotient <= negative ? -combined[31:0] : combined[31:0];
    end
  end
  
endmodule