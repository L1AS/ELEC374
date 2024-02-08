module div_op(
  input signed [31:0] dividend, divisor
  output [63:0] remain_quotient
);
  reg [31:0] M;
  reg [31:0] comp_M;
  reg [31:0] Q;
  reg [31:0] comp_Q
  reg [63:0] combined;
  reg subtract;
  reg negative; // holds value of wether result should be negative
  integer i;


  always @(dividend, divisor) begin
    M <= divisor;
    comp_M <= ~divisor + 1 ;     // take the 2's complement of divisor
    Q <= dividend
    comp_Q = ~dividend + 1;      // take the 2's complement of dividend
    

    

    if(M < 0 && Q < 0) begin
      combined <= {32'b0, comp_dividend};
      M <= ~dividend + 1;   
      comp_dividend <= dividend;
      negative <= 1'b0;                
    end
    else if(M < 0) begin
      combined
    end
      
    else if (dividend < 0)
    if(dividend < 0) combined <= {33'b0, -dividend};
    else assign combined = {32'b0, -dividend};
    for(i = 0; i < 32; i= i + 1) begin
      combined = combine << 1;

      //if MSB is a 1
      if(combined < 0)begin
        
      end

    end



  end
  


endmodule