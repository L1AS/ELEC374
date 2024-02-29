// Ripple Carry Adder
module adder(A, B, Result);

input [31:0] A, B;
output [31:0] Result;

reg [31:0] Result;
reg [32:0] LocalCarry;

integer i;

always@(A or B)
  begin
    LocalCarry = 33'd0;
    for (i = 0; i < 32; i = i + 1)
    begin
      Result[i] = A[i]^B[i]^LocalCarry[i];
      LocalCarry[i+1] = (A[i]&B[i]) | (LocalCarry[i]&(A[i]|B[i]));
    end
  end
endmodule