module div_op(
  input [31:0] dividend, divisor,
  output reg [31:0] remainder, quotient 
);
  reg [31:0] M;
  reg [63:0] combined;
  reg subtract, negative; //control registers
  integer i;
  reg divbyzero; 
 

  always @(*) begin
    // Initialize combined based on the signs of dividend and divisor
	 if(divisor == 32'b0) divbyzero = 1'b1;
	 else divbyzero = 1'b0;
    M = (divisor[31] == 1) ? ~divisor + 1 : divisor;
    combined = {32'b0, (dividend[31] == 1) ? ~dividend + 1 : dividend};
    negative = (dividend[31] == 1) ^ (divisor[31] == 1); // Result is negative if signs differ
    
    subtract = 1'b1;
    
    for(i = 0; i < 32; i = i + 1) begin : division_loop
      combined = {combined[62:0], 1'b0};  // shift left by 1

      combined[63:32] = subtract ? combined[63:32] + (~M + 1) : combined[63:32] + M; 

		
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
    if (combined[63] == 1) remainder <= combined[63:32] + M; // Adjust the remainder
    else remainder <= combined[63:32]; 
	 quotient <= negative ? (~combined[31:0] + 1) : combined[31:0];
	 if(divbyzero) quotient <= 32'h7FFFFFFF;
  end
  
endmodule