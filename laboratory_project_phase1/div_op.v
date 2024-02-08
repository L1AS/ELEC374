module div_op(
  input signed [31:0] dividend, divisor
  output [63:0] remain_quotient
);
  reg [31:0] M, Q, comp_M, comp_Q;
  reg [63:0] combined;
  reg subtract, negative; //control registers
  integer i;


  always @(dividend, divisor) begin
    Q = dividend;
    comp_Q = ~dividend + 1;      // take the 2's complement of dividend
    M = divisor;
    comp_M = ~divisor + 1;

    // Initialize combined based on the signs of dividend and divisor
    if (divisor < 0) M = comp_M;
    combined = {32'b0, (dividend < 0) ? comp_Q : Q};
    negative = (dividend < 0) != (divisor < 0); // Result is negative if signs differ
    
    subtract = 1'b1; //assuming subtraction initially;
    
    for(i = 0; i < 32; i= i + 1) begin
      combined = combined << 1;

      combined[63:32] = subtract ? combined[63:32] + (~M + 1) : combined[63:32] + M; 

      if(combined[63:32] < 0) begin
        subtract = 1'b0;
        combined[0] = 1'b0;
      end
      else begin
        subtract = 1'b1;
        combined[0] = 1'b1;
      end
    end
    if(negative) remain_quotient = ~combined + 1;
    else remain_quotient = ~combined;
  end
  
  
endmodule